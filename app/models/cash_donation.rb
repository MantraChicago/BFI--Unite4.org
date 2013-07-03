class CashDonation < ActiveRecord::Base
  attr_accessible :need_id, :user_id, :amount

  belongs_to :cause, :counter_cache => true
  belongs_to :need
  belongs_to :user, :counter_cache => true

end
