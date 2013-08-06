class CreateTableUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.string :url
      t.integer :user_id
      t.integer :cause_id
      t.integer :contribution_id
      t.string :name
      t.timestamps
    end
  end
end
