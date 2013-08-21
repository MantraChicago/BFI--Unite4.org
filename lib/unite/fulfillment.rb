module Unite
  module Fulfillment
    extend ActiveSupport::Concern

    included do
      class_attribute :update_campaign_method

      after_create :create_contribution_record
      after_create :update_campaign_progress
      
      after_destroy :delete_contribution
    end

    def delete_contribution
      binding.pry
      contribution.try(:destroy)
    end

    def create_contribution_record(need=nil)
      need ||= self.need

      return unless need.present?

      Contribution.create(need_type: need.type_of_need,
                          need_id: need.try(:id),
                          cause_id: self.cause_id,
                          user_id: self.user_id,
                          fulfillment_type: self.class.to_s,
                          fulfillment_id: self.id
                         )
      user=User.find(self.user_id)
      Unite::Badges::BadgeCalculator.delay.calculate_badges_for_user(user,Badge.all)
    end

    def contribution
      Contribution.where(:fulfillment_type => type_of_need, :fulfillment_id => self.id).first
    end

    def type_of_need
      self.class.name
    end

    def related_campaign
      @related_campaign ||= cause.campaigns.active.related_for_need(self.need)
    end


    def update_campaign_progress
      return if progress_updated?
      self.delay.update_campaign_progress_safely!
    end

    def progress_updated?
      @progress_updated == true
    end

    def contribution_increment
      custom_method = self.class.update_campaign_method
      if !custom_method || respond_to?(custom_method)
        return 1
      end
      send(custom_method).to_i
    end

    def update_campaign_progress_safely!
      return unless campaign_object = related_campaign

      campaign_object = Campaign.find(campaign_object.id)

      campaign_object.recalculate_progress!
      campaign_object.save
    end


    def update_campaign_progress_unsafe!
      return unless related_campaign.try(:active?)
      updated_amount = related_campaign.current_state.to_i + contribution_increment
      related_campaign.current_state = updated_amount
      @progress_updated = true
    end

    module ClassMethods
      def updates_campaign_with meth
        self.update_campaign_method = meth
      end
    end
  end
end
