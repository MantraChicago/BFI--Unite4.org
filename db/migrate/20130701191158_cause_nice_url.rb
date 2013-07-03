class CauseNiceUrl < ActiveRecord::Migration
  def change
  	change_table :causes do |t|
  		t.string :slug
  	end
  	add_index :causes, :slug, unique: true
  	Cause.find_each(&:save)
  end
end
