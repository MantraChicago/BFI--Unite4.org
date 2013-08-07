class AddSlugToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :slug, :string
    Badge.create_defaults
  end
end
