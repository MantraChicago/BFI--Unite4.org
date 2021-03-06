require "spec_helper"

describe Api::ContributionsController, :type => :controller do
  include RSpec::Rails::RequestExampleGroup
  include Devise::TestHelpers

  before :each do
    @user= FactoryGirl.create(:user)
    @cash_donations_need=  FactoryGirl.create(:cash_donation_need)
  end

  it "Should be able to create a cash donation" do
    sign_in @user
    amount= 20
    tip =14
    post_data={need_id: @cash_donations_need.id,
               user_id: @user.id,
               donation_amount: amount,
               donation_tip: tip,
               stripeToken: 'tok_2YOdR7oJS2Poee'
               }
    post "/api/contributions", post_data
    
    CashDonation.last.amount.should ==  amount
    CashDonation.last.tip_amount.should == tip

  end

end

