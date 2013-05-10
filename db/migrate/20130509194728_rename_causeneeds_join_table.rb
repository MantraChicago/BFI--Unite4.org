class RenameCauseneedsJoinTable < ActiveRecord::Migration
  def change
  	rename_table :causes_cause_needs, :causes_causeneeds
  end
end
