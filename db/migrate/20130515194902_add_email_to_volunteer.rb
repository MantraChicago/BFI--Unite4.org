class AddEmailToVolunteer < ActiveRecord::Migration
  def change
  	change_table :volunteers do |t|
  		t.string :email
  	end
  end
end
