require 'spec_helper'

describe DonationsController do
	it "A donation should save" do

		post 'create', :donation => { :amount =>10, 
									  :tip =>10, 
									  :donations_need_id =>donationNeed.id }
	end
end
