class AddShowGameInstructions < ActiveRecord::Migration
  def change
  	change_table :games do |t|
  		t.boolean :show_instructions, :default =>true
  	end
  end
end
