class PopulateExisitingCausesCities < ActiveRecord::Migration
  def change

    City.create_defaults
    Cause.all.each do |cause|
      begin
        city = City.find_or_create_by_slug cause.city_slug
        cause.cities << city
        cause.save
      rescue
        puts 'Error saving city'
      end
    end
  end
end
