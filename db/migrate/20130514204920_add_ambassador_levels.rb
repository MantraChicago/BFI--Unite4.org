class AddAmbassadorLevels < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.integer :level, :default =>0
  	end
  end
end
