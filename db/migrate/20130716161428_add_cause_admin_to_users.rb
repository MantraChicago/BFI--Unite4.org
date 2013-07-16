class AddCauseAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cause_admin, :boolean
  end
end
