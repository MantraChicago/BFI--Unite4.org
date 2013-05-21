require 'spec_helper'

describe CauseApplicationController do
	it "Posting correct data should save" do 
		post 'create', :cause_application => { :name => 'Test',
											   :org_name => 'Test',
											   :website => 'www.example.com',
											   :email => 'test@example.com',
											   :phone_number => '4143240411',
											   :misison => 'To party',
											   :how_hear => 'Grapevine' }
											   
	end
end
