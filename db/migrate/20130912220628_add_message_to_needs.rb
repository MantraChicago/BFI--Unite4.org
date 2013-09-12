class AddMessageToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :message, :string
  end
end
