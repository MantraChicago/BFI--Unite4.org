class RemoveUnusedTables < ActiveRecord::Migration
  def change
    begin
      drop_table :games
      drop_table :name
      drop_table :locations_causes
      drop_table :causes_causetypes
      drop_table :causes_causeneeds
      drop_table :permissions
      drop_table :usercauses
      drop_table :badges_users
      drop_table :donations
    rescue
      nil
    end
  end
end
