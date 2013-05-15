class Donation < ActiveRecord::Base
  attr_accessible :amount, :tip, :tracking, :user_id, :donations_need_id

  belongs_to :user

end
