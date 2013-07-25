require 'spec_helper'

describe GoodsDonation do
  it "should increment the campaign by 1" do
    GoodsDonation.new.contribution_increment.should == 1
  end
end

# == Schema Information
#
# Table name: goods_donations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  need_id     :integer
#  cause_id    :integer
#  description :string(255)
#  quantity    :integer
#  cash_value  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

