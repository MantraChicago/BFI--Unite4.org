class SaveUserFacebookToken < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.text :fb_token
  	end
  end
end
