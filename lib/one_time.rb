# Write tasks that can be run just once.
module OneTime
  def self.method_missing meth, *args
    puts "This method does not exist anymore."
  end

  def self.update_geolocation_data_for_locations
    records = Location.all

    puts "Updating the geolocation data of #{ records.count } records".green

    records.each do |loc|
      loc.lookup_geo_coordinates
      loc.save
    end
  end

  def self.create_missing_locations
    Cause.all.each do |cause|
      cause.create_default_location
    end
  end
end

reload!
OneTime.update_geolocation_data_for_locations
OneTime.create_missing_locations
