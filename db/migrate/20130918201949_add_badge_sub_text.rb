class AddBadgeSubText < ActiveRecord::Migration
  def change
    Badge.create_defaults
  end
end
