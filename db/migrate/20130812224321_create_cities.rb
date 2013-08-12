class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :slug
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end

    add_attachment :cities, :picture
    City.create_default
  end
end
