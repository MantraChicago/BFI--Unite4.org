module Unite
  module Development

    SampleAddresses = {
      :chicago => [
        '600 W. Chicago Ave',
        '2350 N. Clark Ave',
        '1200 W. Division St',
        '7530 N. Harlem Ave',
        '3800 S. Halsted St'
      ],
      :new_york => [
        '4 New York Plaza',
        'One Bowling Green',
        '20 West St'
      ],
      :san_francisco => [
        '2130 Fulton Street',
        '109 Germania St',
        '1653 Haight St',
        '1720 Fulton St'
      ]
    }

    class << self
      def load_factories
        require 'factory_girl'
        Dir[Rails.root.join("spec/support/factories/*.rb")].each {|f| require f}
        @factories_loaded = true
      end

      def random_address_in city
        list = (SampleAddresses[city] || SampleAddresses[:chicago])
        index = (list.length * rand()).to_i
        list[index]
      end

      def clear_database
        [Cause,Location,Need,Campaign].each(&:delete_all)
      end

      def create_default_needs_for(causes)
        causes = Array(causes)

        causes.each do |cause|
          need = cause.create_default_need()
          cause.create_default_campaign(need)
        end
      end

      def create *args
        FactoryGirl.send(:create, *args)
      end

      def create_sample_causes_and_locations_in city=:chicago, count=5
        load_factories unless @factories_loaded

        count.times.map do
          cause = create(:cause)
          create(:location, city, cause: cause)
          cause
        end
      end
    end
  end
end
