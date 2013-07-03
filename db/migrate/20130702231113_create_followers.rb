class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :cause_id
      t.integer :user_id
      t.integer :need_id

      t.timestamps
    end

    add_index :followers, :id, :unique => true
    add_index :followers, :cause_id
    add_index :followers, :need_id
    add_index :followers, :user_id
  end
end
