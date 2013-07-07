require "spec_helper"

describe UsersController do
  include Devise::TestHelpers

  let(:user) { create(:user) }

  it "should show not show me my profile if i am not logged in" do
    get :show
    response.should_not be_success
  end

  it "should show me my profile if i am logged in" do
    sign_in(user)
    get :show, :format => :json

    response.should be_success
  end
end
