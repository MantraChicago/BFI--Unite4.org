class UpdateCampaignProgress < ActiveRecord::Migration
  def up
    Campaign.all.each &:recalculate_progress!
  end
end
