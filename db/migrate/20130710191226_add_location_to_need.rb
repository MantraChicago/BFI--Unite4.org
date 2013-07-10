class AddLocationToNeed < ActiveRecord::Migration
  def change
    add_column :needs, :location_id, :integer
  end
end
