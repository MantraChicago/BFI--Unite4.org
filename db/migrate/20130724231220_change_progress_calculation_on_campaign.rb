class ChangeProgressCalculationOnCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :desired_state
    remove_column :campaigns, :current_state

    add_column :campaigns, :desired_state, :integer, :default => 0
    add_column :campaigns, :current_state, :integer, :default => 0
  end

  def down
  end
end
