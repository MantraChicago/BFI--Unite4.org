class AddCountColumnToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :promotions_count, :integer
  end
end
