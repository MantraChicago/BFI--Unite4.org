class AddNameToGoodDonations < ActiveRecord::Migration
  def change
    add_column :goods_donations, :name, :string
    add_column :goods_donations, :phone_number, :string
    add_column :goods_donations, :email, :string
  end
end
