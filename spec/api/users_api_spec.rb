require "spec_helper"

describe Api::ProfilesController, :type => :api do
 

  it "should be able to create a user" do
    user=FactoryGirl.create(:user)
    post_data={:email=>user.email,
               :password=> user.password,
               :first_name => user.first_name}
    post '/api/users', post_data
  end

end