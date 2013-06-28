class AddAddressFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :address_line_one, :string
    add_column :locations, :address_line_two, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :zip, :string
    add_column :locations, :country, :string
  end
end
