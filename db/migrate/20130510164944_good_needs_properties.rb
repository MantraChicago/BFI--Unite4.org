class GoodNeedsProperties < ActiveRecord::Migration
  def up
  	remove_column :good_needs, :discription
  	change_table :good_needs do |t|
  		t.text :description
  		t.text :address
  	end
  end

  
end
