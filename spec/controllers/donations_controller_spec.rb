require 'spec_helper'
include Devise::TestHelpers

describe DonationsController do
	it "A donation should save" do
		sign_in FactoryGirl.create(:user)
		
		donation_need = FactoryGirl.create(:donations_need)
		post 'create', :donation => { :amount =>10, 
									  :tip =>10, 
									  :donations_need_id =>donation_need.id }
		flash[:notice].should_not be_nil
		response.should redirect_to(donation_need.cause)

	end
end
