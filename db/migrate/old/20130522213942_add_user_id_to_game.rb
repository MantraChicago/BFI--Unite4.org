class AddUserIdToGame < ActiveRecord::Migration
  def change
  	
  	change_table :games do |t|
    	t.integer :user_id
    end
  end
end
