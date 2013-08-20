class AddCreatedToUserBadges < ActiveRecord::Migration
  def change
    add_column :user_badges, :created_at, :datetime
  end
end
