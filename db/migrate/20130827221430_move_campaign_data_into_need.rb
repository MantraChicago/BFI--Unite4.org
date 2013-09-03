class MoveCampaignDataIntoNeed < ActiveRecord::Migration
  def up

    Need.unscoped.all.each do |need|
      need.is_active=true
      need.save
    end

    Campaign.all.each do |campaign|
      need=campaign.need
      need.goal_summary = campaign.goal_summary
      need.desired_state = campaign.desired_state
      need.current_state = campaign.current_state
      need.start_date = campaign.start_date
      need.end_date = campaign.end_date
      need.is_primary=true
      need.save
    end
  end

end
