class CreateUserCauses < ActiveRecord::Migration
  def change
    create_table :user_causes do |t|

      t.timestamps
    end
  end
end
