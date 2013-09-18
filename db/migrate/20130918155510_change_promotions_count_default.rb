class ChangePromotionsCountDefault < ActiveRecord::Migration
  def change
    change_column :causes, :promotions_count, :integer ,:default => 0
  end
end
