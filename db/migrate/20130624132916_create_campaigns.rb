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

      t.timestamps
    end
  end
end
