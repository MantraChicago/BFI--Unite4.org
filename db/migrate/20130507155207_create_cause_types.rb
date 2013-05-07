class CreateCauseTypes < ActiveRecord::Migration
  def change
    create_table :cause_types do |t|

      t.timestamps
    end
  end
end
