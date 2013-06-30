class RemoveBadColumns < ActiveRecord::Migration
  def change
  	remove_column :badges_users, :created_at
  	remove_column :badges_users, :updated_at

  end
end
