require "spec_helper"

describe FollowersController do
  include Devise::TestHelpers

  let(:cause) { create(:cause, :skip_default_location => true) }
  let(:user) { create(:user) }

  it "should require me to be logged in" do
    post :create
    response.should_not be_success
  end

  it "should allow a user to a follow a cause" do
    sign_in(user)

    post :create, :cause_id => cause.id, :type_of_need => "FollowerNeed"

    cause.following_users.should include(user)

    response.should be_redirect
  end

  it "should allow a user to unfollow a cause" do
  end

  it "should do nothing if a user is already following and attempts to follow again" do
  end

  it "should throw an error if a user attempts to unfollow a cause they're not following" do
  end

end
