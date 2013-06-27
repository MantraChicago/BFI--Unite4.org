class AddCauseDisplayName < ActiveRecord::Migration
  def change
  	change_table :causes do |t|
  		t.string :display_name
  	end
  end
end
