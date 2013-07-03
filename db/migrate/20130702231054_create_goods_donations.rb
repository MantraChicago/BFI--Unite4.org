class CreateGoodsDonations < ActiveRecord::Migration
  def change
    create_table :goods_donations do |t|
      t.integer :user_id
      t.integer :need_id
      t.integer :cause_id
      t.string :description
      t.integer :quantity
      t.integer :cash_value
      t.timestamps
    end

    add_index :goods_donations, :id, :unique => true
    add_index :goods_donations, :cause_id
    add_index :goods_donations, :need_id
    add_index :goods_donations, :user_id
  end
end
