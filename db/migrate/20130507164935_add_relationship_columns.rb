class AddRelationshipColumns < ActiveRecord::Migration
  def change
  	change_table :cause_needs do |t|
	  t.references :cause
	end


	change_table :locations do |t|
	  t.references :cause
	end

	change_table :user_causes do |t|
	  t.references :cause
	  t.references :user
	end

	create_table :locations_causes, :id => false do |t|
        t.references :location
        t.references :cause
    end
  end
end
