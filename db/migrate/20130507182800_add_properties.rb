class AddProperties < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :img_name
    end

    change_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
    end

    change_table :subscribes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
    end

    change_table :cause_types do |t|
      t.string :name
    end

    change_table :cause_needs do |t|
      t.string :name
    end

   
  end
end
