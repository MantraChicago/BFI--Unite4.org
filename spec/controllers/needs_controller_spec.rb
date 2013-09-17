require "spec_helper"

describe NeedsController do
  include Devise::TestHelpers

  before :each do
    @user = FactoryGirl.create :user
    @cause= FactoryGirl.create :cause, :user_id =>@user.id
    @goods_donation_need =FactoryGirl.create :goods_donation_need, :cause => @cause
  end

  it "should be able to create a new need" do
    sign_in(@user)
    post_data={"cause_slug"=>@cause.slug,
               "need_type"=>"cash_donation_needs",
               "cash_donation_need"=>
                {"name"=>"test", "desired_state"=>"223", "description"=>"23232"},
               }
    post :create, post_data
 
    @cause.reload
    @cause.needs.last.type.should == 'CashDonationNeed'
  end

  it 'should be able to promote need to primary' do
    sign_in(@user)

    put :update, :id => @goods_donation_need.id, 'goods_donation_need' => {:is_primary => 'true'}
    @goods_donation_need.reload
    @goods_donation_need.is_primary.should == true
    @cause.reload
    @cause.needs.where(:is_primary => true).all.count.should ==1
  end

  it 'should be able to deactive a need' do
    sign_in(@user)

    put :update, :id => @goods_donation_need.id, 'goods_donation_need' => {:is_active => 'false'}
    @goods_donation_need.reload
    @goods_donation_need.is_active.should == false
  end

end
