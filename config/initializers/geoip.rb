require 'geoip'

$GeoIpLocation=GeoIP::City.new("#{Rails.root}/vendor/geoip/GeoLiteCity.dat")
