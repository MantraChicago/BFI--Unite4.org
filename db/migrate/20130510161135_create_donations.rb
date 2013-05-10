class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.float :amount
      t.float :tip
      t.string :tracking

      t.timestamps
    end
  end
end
