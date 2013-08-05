class ChangeSubscribeTableName < ActiveRecord::Migration
  def change
    rename_table :subscribes, :subscribers
  end
end
