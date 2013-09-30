require "spec_helper"
require "rspec_api_documentation/dsl"

resource "Creating donations on behalf of a user" do
  let(:user) { create(:user) }
  let(:need) { create(:cash_donation_need,:type_of_need=>"cash_donations") }
  #let(:cause) { need.cause }

  post "/api/contributions" do
    #parameter :cause_id, "The ID of the cause being donated to", :required => true
    parameter :donation_amount, "The amount of the donation to go to the specified cause. In dollars and cents. Example: 99.99", :required => true
    parameter :tip_amount, "The amount of the tip to go to the unite4 organization. In dollars and cents. Defaults to 0.0. Example: 99.99", :required => false
    parameter :stripe_token, "The transaction token obtained from the Stripe Credit Card process.", :required => true
    parameter :user_id, "The user id", :required => true

    example "Creating a donation to a charity" do
      do_request(auth_token: user.authentication_token, need_id: need.id, user_id: user.id, tip_amount: 25.00, :donation_amount => 0.00, :stripe_token => "tok_2RK6LqrV6URfA0")
      status.should == 200
    end
  end
end
