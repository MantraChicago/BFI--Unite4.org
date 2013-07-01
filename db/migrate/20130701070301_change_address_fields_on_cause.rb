class ChangeAddressFieldsOnCause < ActiveRecord::Migration
  def up
    add_column :causes, :address_line_one, :string
    add_column :causes, :address_line_two, :string
    add_column :causes, :postal_code, :string
    add_column :causes, :country, :string
    rename_column :causes, :state, :region
  end

  def down
  end
end
