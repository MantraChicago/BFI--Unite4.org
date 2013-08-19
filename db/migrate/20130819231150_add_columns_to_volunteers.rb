class AddColumnsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :availability, :string
    add_column :volunteers, :email, :string
    add_column :volunteers, :phone_number, :string
    add_column :volunteers, :name, :string
    add_column :volunteers, :description, :text
  end
end
