class AddFieldsToCauseApplication < ActiveRecord::Migration
  def change
    add_column :cause_applications, :facebook, :string
    add_column :cause_applications, :twitter, :string
    add_column :cause_applications, :mailing_address, :text
    
  end
end
