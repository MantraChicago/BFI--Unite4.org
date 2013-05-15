class AddDonationDonationsNeedsId < ActiveRecord::Migration
  def change
  	change_table :donations do |t|
  		t.integer :donations_need_id
  	end
  end
end
