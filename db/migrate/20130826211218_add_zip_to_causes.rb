class AddZipToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :zip_code, :integer
  end
end
