require 'spec_helper'
#include Devise::TestHelpers


describe VolunteersController do
	it "should redirect to sign in page if not logged in" do
		sign_out FactoryGirl.create(:user)
		volunteer_need= FactoryGirl.create(:volunteer_need)
		get :new, :volunteer_need_id => volunteer_need.id
		response.should redirect_to(new_user_registration_path)
	end

	it "should redirect to cause page if logged in" do
		user= FactoryGirl.create(:user)
		sign_in user
		volunteer_need= FactoryGirl.create(:volunteer_need)
		post :create, :volunteer => {:volunteer_need_id => volunteer_need.id,
									 :first_name => user.first_name,
									 :last_name =>user.last_name,
									 :email => user.email}
		response.should redirect_to(volunteer_need.cause)
	end
end
