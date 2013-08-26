class AddBankInfoForCauses < ActiveRecord::Migration
  def change
    add_column :causes, :bank_account, :integer
    add_column :causes, :bank_routing, :integer
  end
end
