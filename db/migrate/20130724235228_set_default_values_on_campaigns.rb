class SetDefaultValuesOnCampaigns < ActiveRecord::Migration
  def up
    Campaign.all.each do |campaign|
      campaign.save
    end
  end

  def down
  end
end
