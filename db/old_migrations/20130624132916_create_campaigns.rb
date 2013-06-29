class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :cause_id
      t.integer :need_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :percent_complete
      t.string :desired_state
      t.string :current_state
      t.boolean :active, :default => false
      t.timestamps
    end

    add_index :campaigns, :id, :unique => true
    add_index :campaigns, :active
    add_index :campaigns, :need_id
    add_index :campaigns, :cause_id
  end
end
