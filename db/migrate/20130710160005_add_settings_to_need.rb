class AddSettingsToNeed < ActiveRecord::Migration
  def change
    add_column :needs, :settings, :text
  end
end
