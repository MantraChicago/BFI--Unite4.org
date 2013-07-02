module Unite
  class NeedsProgressCalculator

    class 
    attr_accessor :campaign

    def initialize(campaign)

    end

    def percent_complete

    end

    protected
      def calculator
        "#{ need.type_of_need }_calculator".camelize.constantize
      end
      
      def need
        campaign.need
      end
  end
end