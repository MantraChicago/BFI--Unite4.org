class AddCampaignFieldsToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :goal_summary, :string
    add_column :needs, :timefame_description, :string
    add_column :needs, :percent_complete, :string
    add_column :needs, :desired_state, :float
    add_column :needs, :current_state, :float
    add_column :needs, :is_primary, :boolean
    add_column :needs, :is_active, :boolean, :default => true

    Need.all.each do |need|
      need.is_active = true
      need.save
    end
  end
end
