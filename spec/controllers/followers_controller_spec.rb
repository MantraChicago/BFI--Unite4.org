require "spec_helper"

describe FollowersController do
  include Devise::TestHelpers

  before :each do
    @cause = create(:cause)
    @followers_need= create :follower_need, :cause => @cause
    @user = create :user
  end
  
  it "should require me to be logged in" do
    post :create
    response.should_not be_success
  end

  it "should allow a user to a follow a cause" do
    sign_in(@user)
    post :create, :cause_id => @cause.id, :type_of_need => @followers_need.type
    @cause.followers.last.user.should==@user
    response.should be_redirect
  end

  it 'a user should be able to unfollow a cause and its contributions should be cleared' do
    sign_in(@user)
    post :create, :cause_id => @cause.id, :type_of_need => @followers_need.type
    @followers_need.reload
    @followers_need.contributions.count.should==1
    delete :destroy, {:cause_slug => @cause.slug}
    @followers_need.reload
    @followers_need.contributions.count.should==0
  end

  it "should allow a user to unfollow a cause" do
    sign_in(@user)
    @user.follow(@cause)
    delete :destroy, {:cause_slug => @cause.slug}
    @user.causes.include?(@cause).should == false
  end

  it "should do nothing if a user is already following and attempts to follow again" do
    @user.follow(@cause)

  end


end
