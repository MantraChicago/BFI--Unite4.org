class RenameUserCauseTable < ActiveRecord::Migration
  def change
  	rename_table :user_causes, :usercauses
  end

end
