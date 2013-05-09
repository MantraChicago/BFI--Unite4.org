class RenameCauseneeds < ActiveRecord::Migration
  def change
  	rename_table :cause_needs, :causeneeds
  end
end
