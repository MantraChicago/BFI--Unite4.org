class AddTimeframeDescriptionToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :timefame_description, :string
  end
end
