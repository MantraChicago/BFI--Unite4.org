class FixHabtm < ActiveRecord::Migration
  def change
  	create_table :causes_cause_types do |t|
  		t.integer :cause_id
  		t.integer :cause_type_id
  	end

  end
end
