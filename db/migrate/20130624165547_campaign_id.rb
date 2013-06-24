class CampaignId < ActiveRecord::Migration
  def change
  	change_table :needs do |t|
  		t.integer :campaign_id
  	end
 
  end
end
