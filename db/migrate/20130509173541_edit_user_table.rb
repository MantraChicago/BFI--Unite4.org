class EditUserTable < ActiveRecord::Migration
  def change
  	 change_table :users do |t|
      t.text :bio
     end

     remove_column :users, :img_name
  end
end
