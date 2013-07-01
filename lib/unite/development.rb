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

      def update_geolocation_data_for_locations
        records = Location.all

        puts "Updating the geolocation data of #{ records.count } records".green

        records.each do |loc|
          loc.lookup_geo_coordinates
          loc.save
        end
      end

      def create_missing_locations
        Cause.all.each do |cause|
          cause.create_default_location unless cause.locations.count == 0
        end
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

      def create_sample_causes_and_locations_in city=:chicago, options={}
        load_factories unless @factories_loaded

        if options.is_a?(Fixnum)
          options = {}
        end

        count ||= options[:count] || 3

        count.times.map do
          cause = create(:cause, cause_type: options[:cause_type], :skip_default_location => true)
          create(:location, city, cause: cause)
          cause
        end
      end
    end
  end
end
