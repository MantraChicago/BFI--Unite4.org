class AddCauseActive < ActiveRecord::Migration
  def change
  	change_table :causes do |t|
  		t.boolean :active
  	end
  end
end
