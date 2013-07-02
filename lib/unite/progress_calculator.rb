module Unite
  # The purpose of the progress calculator is to
  # accept a campaign object, which has a specific type of need
  # and figure out how much progress has been made by aggregating
  # the fulfillment activity taken against a given need or campaign
  class ProgressCalculator

    # updates the current_state attribute of a campaign
    # with the current value returns by the calculator
    # for a given need / fulfillment
    def self.update_progress_for(campaign)

    end

    attr_accessor :campaign

    def initialize(campaign_or_need)
      @campaign = campaign_or_need
    end

    def current_progress

    end

    protected
      def calculator
        calculator_class.new(campaign)
      end

      def calculator_class
        specific = "#{ need.type_of_need }_calculator".camelize
        "Unite::#{ specific }".camelize
      end

      def need
        campaign.need
      end

  end
end
