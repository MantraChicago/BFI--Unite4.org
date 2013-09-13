class AddCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :promotions_count, :integer
  end
end
