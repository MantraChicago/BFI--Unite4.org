class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
    	t.string :name
    	t.string :file_name
    	t.string :accomplishment
    	t.text :description
      t.timestamps
    end

    create_table :badges_users, :id => false do |t|
    	t.integer :user_id
    	t.integer :badge_id
    end
  end
end
