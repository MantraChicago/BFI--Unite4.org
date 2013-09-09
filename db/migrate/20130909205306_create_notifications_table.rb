class CreateNotificationsTable < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string 'message'
      t.string 'title'
      t.string 'link'
      t.string 'img_link'
      t.integer 'user_id'
      t.timestamps
    end
  end
end
