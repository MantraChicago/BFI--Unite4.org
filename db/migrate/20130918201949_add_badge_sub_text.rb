class AddBadgeSubText < ActiveRecord::Migration
  def change
    add_column :badges, :sub_text, :string
    Badge.create_defaults
  end
end
