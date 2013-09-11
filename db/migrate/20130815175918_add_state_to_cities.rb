class AddStateToCities < ActiveRecord::Migration
  def change
    change_column :cities, :latitude, :float
    change_column :cities, :longitude, :float
    #City.create_defaults
  end
end
