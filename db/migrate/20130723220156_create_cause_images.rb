class CreateCauseImages < ActiveRecord::Migration
  def change
    create_table :cause_images do |t|
      t.integer :cause_id

      t.timestamps
    end
  end
end
