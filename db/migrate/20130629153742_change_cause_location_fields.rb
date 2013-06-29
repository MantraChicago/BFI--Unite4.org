class ChangeCauseLocationFields < ActiveRecord::Migration
  def up
    rename_column :causes, :state, :region
    add_column :causes, :address_line_one, :string
    add_column :causes, :address_line_two, :string
    add_column :causes, :postal_code, :string
    add_column :causes, :country, :string
  end

  def down
    rename_column :causes, :region, :state
    remove_column :causes, :address_line_one
    remove_column :causes, :address_line_two
    remove_column :causes, :postal_code
    remove_column :causes, :country
  end
end
