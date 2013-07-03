class AddCounterCacheColumnsForNeeds < ActiveRecord::Migration
  def up
    add_column :users, :followers_count, :integer, :default => 0
    add_column :users, :cash_donations_count, :integer, :default => 0
    add_column :users, :goods_donations_count, :integer, :default => 0
    add_column :users, :volunteers_count, :integer, :default => 0


  end

  def down
  end
end
