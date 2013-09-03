module Unite
  module Fulfillment
    extend ActiveSupport::Concern

    included do
      class_attribute :update_campaign_method

      after_create :create_contribution_record
      after_create :update_current_need_state
      
      after_destroy :delete_contribution
    end

    def delete_contribution
      contribution.try(:destroy)
    end

    def create_contribution_record(need=nil)
      need ||= self.need

      return unless need.present?

      Contribution.create(need_type: need.type,
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


    def update_current_need_state
      #TODO add delay
      self.update_need_current_state(need_id) if (self.need && self.need.is_primary)
    end

    def update_need_current_state(need_id)
      state=get_current_need_state(need_id)
      need=Need.find(need_id)
      need.current_state=state
      need.save
    end

    def get_current_need_state need_id
      Contribution.find_all_by_need_id(need_id).count
    end

    module ClassMethods
      def updates_campaign_with meth
        self.update_campaign_method = meth
      end
    end
  end
end
