class AddCauseAdminIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cause_admin_id, :integer
  end
end
