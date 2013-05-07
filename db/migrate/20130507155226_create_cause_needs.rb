class CreateCauseNeeds < ActiveRecord::Migration
  def change
    create_table :cause_needs do |t|

      t.timestamps
    end
  end
end
