class AddTimestampsToVolunteerNeeds < ActiveRecord::Migration
  def change
  	change_table :volunteer_needs do |t|
  		t.timestamp :start_date
  		t.timestamp :end_date
  	end
  end
end
