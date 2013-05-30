require 'spec_helper'

describe ProfilesController do


	it "A user should be able to follow causes" do
		
		cause = FactoryGirl.create(:cause)
		user = FactoryGirl.create(:user)
		sign_in user

		post :follow_cause, :id => cause.id 

		user.causes.include?(cause).should be_true 
	end
	
	it "A user should be able to edit their name" do
		
		user = FactoryGirl.create(:user)
		sign_in user

		post 'edit', :user =>{:first_name => 'bill',
							  :last_name => 'joe'}

		user.reload

		response.should redirect_to profiles_path
		user.first_name.should == 'bill'
		user.last_name.should == 'joe'

		
	end

	it "A user should be able to edit followed causes" do
		cause = FactoryGirl.create(:cause)
		user = FactoryGirl.create(:user)
		sign_in user

		post 'edit', :user =>{:cause_ids => [cause.id]}

		user.reload

		user.causes.include?(cause).should be_true 

		
	end

	it "A user should be able to not follow any causes" do
		user = FactoryGirl.create(:user)
		sign_in user

		post 'edit', :user =>{:cause_ids => []}

		user.reload

		user.causes.count.should == 0
		
	end

end
