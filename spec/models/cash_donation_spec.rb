require 'spec_helper'

describe CashDonation do
  it "should have an increment amount equal to the total donation" do
    CashDonation.new(:amount=>50.0,:tip_amount=>25.0).contribution_increment.should == 50 * 100
  end
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

