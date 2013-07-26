class RenameColumnOnCampaign < ActiveRecord::Migration
  def up
    rename_column :campaigns, :timefame_description, :timeframe_description

    Campaign.all.each do |c|
      c.set_defaults
      c.save
    end
  end

  def down
  end
end
