class CashDonation < ActiveRecord::Base
  attr_accessible :need_id, :user_id, :amount

  belongs_to :cause, :counter_cache => true
  belongs_to :need
  belongs_to :user, :counter_cache => true

end

# == Schema Information
#
# Table name: cash_donations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  need_id    :integer
#  cause_id   :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

