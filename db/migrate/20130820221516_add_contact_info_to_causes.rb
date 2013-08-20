class AddContactInfoToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :contact_name, :string
    add_column :causes, :contact_phone_number, :string
    add_column :causes, :contact_address, :text
  end
end
