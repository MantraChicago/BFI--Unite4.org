class AddCauseSocialProperties < ActiveRecord::Migration
  def change
  	change_table :causes do |t|
  		t.string :twitter_handle
  		t.string :facebook_url
  	end
  end
end
