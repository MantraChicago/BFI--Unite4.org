class AddingCampaignActive < ActiveRecord::Migration
  def change
  	change_table :campaigns do |t|
  		t.boolean :active
  	end
  end
end
