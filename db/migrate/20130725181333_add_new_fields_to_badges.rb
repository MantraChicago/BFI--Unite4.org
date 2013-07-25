class AddNewFieldsToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :description_after, :text
    add_column :badges, :description_before, :text
    add_column :badges, :category, :string
    add_column :badges, :type, :string
    add_column :badges, :sub_text, :string
  end
end
