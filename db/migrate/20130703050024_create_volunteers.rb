class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers, :force => true do |t|
      t.integer :cause_id
      t.integer :user_id
      t.integer :need_id
      t.integer :location_id
      t.string :description
      t.boolean :user_showed_up, :default => false
      t.timestamps
    end

    add_index :volunteers, :id, :unique => true
    add_index :volunteers, :cause_id
    add_index :volunteers, :need_id
    add_index :volunteers, :user_id
    add_index :volunteers, :location_id

    add_column :causes, :cash_donations_count, :integer, :default => 0
    add_column :causes, :goods_donations_count, :integer, :default => 0
  end
end
