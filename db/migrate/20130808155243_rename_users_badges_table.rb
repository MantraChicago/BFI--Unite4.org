class RenameUsersBadgesTable < ActiveRecord::Migration
  def change
    rename_table :users_badges, :user_badges
  end
end
