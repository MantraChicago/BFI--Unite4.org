class CauseneedHasManyChange < ActiveRecord::Migration
  def change
  	drop_table :causes_causeneeds
  end
end
