class CauseCauseneedProperties < ActiveRecord::Migration
  def change
  	change_table :cause_causeneeds do |t|
      t.integer :id
      t.references :cause
      t.references :causeneed
     end
  end
end
