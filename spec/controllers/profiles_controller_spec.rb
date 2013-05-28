require 'spec_helper'
include Devise::TestHelpers

describe ProfilesController do


	it "A user should be able to follow causes" do
		
		cause = FactoryGirl.create(:cause)
		user = FactoryGirl.create(:user)
		sign_in user

		post :follow_cause, :id => cause.id 

		user.causes.include?(cause).should be_true 
	end
	
end
