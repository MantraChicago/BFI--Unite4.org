class NeedsNames < ActiveRecord::Migration
  def change
  	change_table :donations_needs do |t|
  		t.string :name
  	end

  	change_table :volunteer_needs do |t|
  		t.string :name
  	end

  	change_table :good_needs do |t|
  		t.string :name
  	end

  	change_table :social_needs do |t|
  		t.string :name
  	end
  end
end
