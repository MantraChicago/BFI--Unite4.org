class TurningOnAllCampaigns < ActiveRecord::Migration
  def change
    Campaign.all.each do |campaign|
      campaign.active=true
      campaign.save
    end
  end
end
