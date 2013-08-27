class AddAddressToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :address, :string
    add_column :causes, :state, :string

  end

end
