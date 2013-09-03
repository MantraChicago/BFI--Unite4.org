=begin We are not using the api functionality yet
require "spec_helper"

describe "The Contributions API", :type => :api do
  let(:contribution) { create(:contribution) }
  let(:user) { contribution.user }

  it "should include all of the users contributions" do
    get "/api/v1/contributions/default"
    JSON.parse(response.body).length.should == 0
  end

  it "should be successful if supplied with an auth token" do
    Contribution.delete_all

    get "/api/v1/contributions/default?auth_token=#{ user.authentication_token }"

    JSON.parse(response.body).length.should == 1
    response.should be_success
  end
end
=end
