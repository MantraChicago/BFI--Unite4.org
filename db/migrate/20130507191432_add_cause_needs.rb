class AddCauseNeeds < ActiveRecord::Migration
  def change
  	create_table :causes_cause_needs, :id => false do |t|
        t.references :cause
        t.references :cause_need
    end
  end
end
