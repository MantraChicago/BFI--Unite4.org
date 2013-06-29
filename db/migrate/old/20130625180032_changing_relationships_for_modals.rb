class ChangingRelationshipsForModals < ActiveRecord::Migration
  def change
  	change_table :causes do |t|
  		t.integer :city_id
  	end
  end
end
