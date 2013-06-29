class AddAddressFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :address_line_one, :string
    add_column :locations, :address_line_two, :string
    add_column :locations, :city, :string
    add_column :locations, :region, :string
    add_column :locations, :postal_code, :string
    add_column :locations, :country, :string
  end
end
