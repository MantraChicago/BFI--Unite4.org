class AddFeaturedCauses < ActiveRecord::Migration
  def change
  	change_table :causes do |t|
  		t.boolean :is_featured, :default => false
  	end
  end
end
