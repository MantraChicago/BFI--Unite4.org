class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :volunteer_need_id
      t.timestamps
    end
  end
end
