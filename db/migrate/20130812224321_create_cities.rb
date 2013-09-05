class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :state
      t.string :name
      t.string :slug
      t.integer :latitude
      t.integer :longitude
      t.has_attached_file :picture

      t.timestamps
    end


    create_table :causes_cities, :id => false do |t|
      t.integer :city_id
      t.integer :cause_id
    end

  end


end
