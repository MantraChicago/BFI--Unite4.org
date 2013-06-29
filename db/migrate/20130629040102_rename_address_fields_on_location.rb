class RenameAddressFieldsOnLocation < ActiveRecord::Migration
  def up
    rename_column :locations, :zip, :postal_code
    rename_column :locations, :state, :region
  end

  def down
    rename_column :locations, :postal_code, :zip
    rename_column :locations, :region, :state
  end
end
