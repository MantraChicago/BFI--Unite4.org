class AddFieldsToUserBadges < ActiveRecord::Migration
  def change
    add_column :users_badges, :created, :timestamp
    add_column :users_badges, :cause_id, :integer
    add_column :users_badges, :contribution_id, :integer
  end
end
