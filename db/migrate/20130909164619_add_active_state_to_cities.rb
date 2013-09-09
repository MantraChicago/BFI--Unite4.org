class AddActiveStateToCities < ActiveRecord::Migration
  def change
    add_column :cities, :is_active, :boolean

    City.all.each do |city|
      city.is_active=(city.slug=='chicago' ||  city.slug=='miami') ? true : false
      city.save
    end
  end
end
