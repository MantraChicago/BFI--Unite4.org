class AddFulfillmentTypeAndIdToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :fulfillment_type, :string
    add_column :contributions, :fulfillment_id, :integer
  end
end
