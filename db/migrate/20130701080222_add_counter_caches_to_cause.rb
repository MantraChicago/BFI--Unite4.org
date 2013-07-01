class AddCounterCachesToCause < ActiveRecord::Migration
  def change
    add_column :causes, :locations_count, :integer, :default => 0
    add_column :causes, :needs_count, :integer, :default => 0
    add_column :causes, :donations_count, :integer, :default => 0
    add_column :causes, :volunteers_count, :integer, :default => 0
    add_column :causes, :followers_count, :integer, :default => 0
  end
end
