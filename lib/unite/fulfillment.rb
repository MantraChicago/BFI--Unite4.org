module Unite
  module Fulfillment
    extend ActiveSupport::Concern

    included do
      class_attribute :update_campaign_method
      after_commit :update_campaign_progress, :unless => :progress_updated?
    end


    def related_campaign
      @related_campaign ||= cause.campaigns.active.where(:need_id => self.need_id).first
    end

    # TODO
    #
    # This has to change if we're going to scale.
    #
    # The reason we need to use a calculator which scans the entire fulfillment
    # eco system for this amount is because what if two campaigns are updated
    # at the same time, and they add their contribution_amount to the current_state?
    #
    # potential race state.
    def update_campaign_progress
      update_campaign_progress_unsafe!
    end

    def progress_updated?
      @progress_updated == true
    end

    def contribution_increment
      custom_method = self.class.update_campaign_method
      return 1 unless respond_to?(custom_method)
      send(custom_method).to_i
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
