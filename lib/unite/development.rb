module Unite
  module Development

    SampleAddresses = {
      :chicago => [
        '600 W. Chicago Ave. Chicago, IL',
        '2350 N. Clark Ave. Chicago, IL',
        '1200 W. Division St. Chicago, IL',
        '7530 N. Harlem Ave. Chicago, IL',
        '3800 S. Halsted St. Chicago, IL'
      ]
    }

    class << self
      def load_factories
        require 'factory_girl'
        Dir[Rails.root.join("spec/support/factories/*.rb")].each {|f| require f}
        @factories_loaded = true
      end

      def create_default_needs_for(causes)
        causes = Array(causes)

        causes.each do |cause|
          need = cause.create_default_need()
          cause.create_default_campaign(need)
        end
      end

      def create_sample_causes_and_location_in city=:chicago, count=nil
        load_factories unless @factories_loaded

        list = Array(SampleAddresses[city]).slice(0, count || 5)

        list.map do |address|
          cause       = FactoryGirl.create(:cause)
          #cause_type  = CauseType.random() || FactoryGirl.create(:cause_type)

          FactoryGirl.create(:location, cause_id: cause.id, address:address )

          cause
        end
      end
    end
  end
end
