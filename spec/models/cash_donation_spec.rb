require 'spec_helper'

describe CashDonation do
  pending "add some examples to (or delete) #{__FILE__}"
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
#  stripe_id  :string(255)
#  tip_amount :integer
#

