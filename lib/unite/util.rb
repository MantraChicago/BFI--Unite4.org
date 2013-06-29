module Unite
  module Util
    class << self
      def perform_cached_geolocation_of(input)
        @cache ||= {}
        input = input.to_s.strip

        @cache[input] ||= Geokit::Geocoders::MultiGeocoder.geocode(input)
      end

      def lookup_address_details(input)
        response = perform_cached_geolocation_of(input)

        {
          lat: response.lat,
          lng: response.lng,
          country: response.country_code || response.country,
          region: response.state || response.province,
          postal_code: response.zip
        }
      end
    end
  end
end
