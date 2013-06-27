module Unite
  module Util
    class << self
      def perform_cached_geolocation_of(input)
        @cache ||= {}
        input = input.to_s.strip

        @cache[input] ||= Geokit::Geocoders::MultiGeocoder.geocode(input)
      end

      def get_coordinates_for(input)
        response = perform_cached_geolocation_of(input)
        [ response.try(:lat), response.try(:lng) ].compact
      end
    end
  end
end
