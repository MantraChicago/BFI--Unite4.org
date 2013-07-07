class AddAdditionalColumnsToCampaignAndCause < ActiveRecord::Migration
  def change
    add_column :campaigns, :type_of_need, :string
    add_column :campaigns, :goal_summary, :string

    add_column :causes, :short_description, :string

    add_index :campaigns, :type_of_need
  end
end
