class UpdatesBadgesAndCities < ActiveRecord::Migration
  def change
    Badge.create_defaults
    City.where(:latitude => nil, :longitude => nil).destroy_all

    Need.all.each do |need| #make sure this is done
      if need.type_of_need
        need.type= need.type_of_need.singularize.classify+'Need'
      end
      need.is_active=true
      need.is_primary=false
      need.save
    end

    Campaign.all.each do |campaign|
      primary_need = campaign.need
      primary_need.is_primary =true
      primary_need.end_date = Time.zone.now + 1.month
      primary_need.save
    end
  end
end
