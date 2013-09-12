class CreatePromotionTable < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :need_id
      t.integer :user_id
      t.integer :cause_id
      t.string :message
      t.string :method
    end
  end
end