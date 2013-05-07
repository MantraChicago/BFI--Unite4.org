class AddCauseRelationship < ActiveRecord::Migration
  def change
  	 change_table :causes do |t|
      t.references :cause_type
    end
  end
end
