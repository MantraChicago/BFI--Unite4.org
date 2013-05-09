class CreateCauseCauseneeds < ActiveRecord::Migration
  def change
    create_table :cause_causeneeds do |t|

      t.timestamps
    end
  end
end
