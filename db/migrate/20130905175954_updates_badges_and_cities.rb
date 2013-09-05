class UpdatesBadgesAndCities < ActiveRecord::Migration
  def change
    Badge.create_defaults
    City.where(:latitude => nil, :longitude => nil).destroy_all

    Need.all.each do |need| #make sure this is done
      if need.type_of_need
        need.type= need.type_of_need.singularize.classify+'Need'
        need.save
      end
    end
  end
end
