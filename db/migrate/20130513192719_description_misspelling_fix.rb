class DescriptionMisspellingFix < ActiveRecord::Migration
  def change
  	change_table :volunteer_needs do |t|
  		t.string :address
  	end

  	rename_column :volunteer_needs, :discription, :description

  	rename_column :donations_needs, :discription, :description

  	rename_column :social_needs, :discription, :description

  	
  end
end
