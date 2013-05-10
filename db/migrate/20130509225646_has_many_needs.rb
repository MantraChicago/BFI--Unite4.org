class HasManyNeeds < ActiveRecord::Migration
  def change
  	
  	drop_table :cause_causeneeds
  	drop_table :causeneeds

  	create_table :donations_needs do |t|
  		t.references :cause
  		t.text :discription
  	end

  	create_table :volunteer_needs do |t|
  		t.references :cause
  		t.text :discription
  	end

  	create_table :good_needs do |t|
  		t.references :cause
  		t.text :discription
  	end

  	create_table :social_needs do |t|
  		t.references :cause
  		t.text :discription
  	end

  end
end
