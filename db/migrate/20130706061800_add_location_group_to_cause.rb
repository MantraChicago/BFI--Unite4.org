class AddLocationGroupToCause < ActiveRecord::Migration
  def change
    add_column :causes, :city_slug, :string
    add_column :cause_types, :slug, :string

    add_index :causes, :city_slug
    add_index :cause_types, :slug
  end
end
