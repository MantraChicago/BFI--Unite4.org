class CauseCauseneedProperties < ActiveRecord::Migration
  def change
  	create_table :cause_causeneeds do |t|
      t.references :cause
      t.references :causeneed
     end
  end
end