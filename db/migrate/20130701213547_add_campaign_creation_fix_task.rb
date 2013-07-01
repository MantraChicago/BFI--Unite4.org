class AddCampaignCreationFixTask < ActiveRecord::Migration
  def up
    OneTime.set_cause_type_id
  end

  def down
  end
end
