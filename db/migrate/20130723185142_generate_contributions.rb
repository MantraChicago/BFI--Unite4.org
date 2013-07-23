class GenerateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :user_id
      t.integer :cause_id
      t.integer :fulfilment_id
      t.string :fulfilment_type

      t.integer :need_id
      t.string :need_type

      t.timestamps
    end
  end
end
