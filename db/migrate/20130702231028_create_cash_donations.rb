class CreateCashDonations < ActiveRecord::Migration
  def change
    create_table :cash_donations do |t|
      t.integer :user_id
      t.integer :need_id
      t.integer :cause_id
      t.integer :amount
      t.timestamps
    end

    add_index :cash_donations, :id, :unique => true
    add_index :cash_donations, :cause_id
    add_index :cash_donations, :need_id
    add_index :cash_donations, :user_id
  end
end
