class AddContactEmailToCause < ActiveRecord::Migration
  def change
    add_column :causes, :contact_email, :string
  end
end
