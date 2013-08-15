class AddStateToCities < ActiveRecord::Migration
  def change
    add_column :cities, :state, :string
    change_column :cities, :latitude, :float
    change_column :cities, :longitude, :float
  end
end
