class AddCauseProperties < ActiveRecord::Migration
  def change
  	 change_table :causes do |t|
      t.string :name
      t.text :description
      t.text :mission_statement
      t.text :how_hear
      t.string :phone_number
      t.string :email
      t.string :website
    end
  end
end
