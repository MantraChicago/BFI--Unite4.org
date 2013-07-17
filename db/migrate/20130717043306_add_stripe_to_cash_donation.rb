class AddStripeToCashDonation < ActiveRecord::Migration
  def change
    add_column :cash_donations, :stripe_id, :string
    add_column :cash_donations, :tip_amount, :integer
  end
end
