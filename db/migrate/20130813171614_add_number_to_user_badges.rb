class AddNumberToUserBadges < ActiveRecord::Migration
  def change
    add_column :user_badges, :number, :integer
    
  end
end
