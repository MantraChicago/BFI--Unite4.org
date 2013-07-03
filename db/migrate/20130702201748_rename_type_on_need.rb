class RenameTypeOnNeed < ActiveRecord::Migration
  def up
    rename_column :needs, :type, :type_of_need
  end
end
