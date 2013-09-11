require "spec_helper"

describe Api::ProfilesController do
  include RSpec::Rails::RequestExampleGroup

  before :each do
    @user=FactoryGirl.build(:user)
  end

  it "should be able to create a user" do
    post_data={:email=>@user.email,
               :password=> @user.password,
               :first_name => @user.first_name}
    post 'api/profiles/create', :user => post_data
    User.last.first_name.should ==  @user.first_name
    User.last.email.should ==  @user.email
    response.status.should==200
  end

  it "should not be able to create a user if there is no password" do

    post_data={:email=>@user.email,
               :first_name => @user.first_name}
    post 'api/profiles/create', :user => post_data
    response.status.should==500
    
  end

end