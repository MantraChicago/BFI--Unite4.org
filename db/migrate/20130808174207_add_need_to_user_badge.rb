class AddNeedToUserBadge < ActiveRecord::Migration
  def change
    add_column :user_badges, :need_id, :integer
  end
end
