class AddCityStateToUsersAndCauses < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :city
  		t.string :state
  	end

  	change_table :causes do |t|
  		t.string :city
  		t.string :state
  		t.string :video_link
  	end
  end
end
