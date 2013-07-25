class AddUserToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :user_id, :integer
  end
end
