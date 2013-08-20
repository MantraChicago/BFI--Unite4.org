class AddNeedIdToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :need_id, :integer
  end
end
