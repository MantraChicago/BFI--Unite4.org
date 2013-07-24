require "spec_helper"

describe Campaign do
  let(:cause) { create(:cause, :skip_default_location => true) }
  let(:proxy) { Unite::NeedsFulfillmentProxy }
  let(:need) { create(:need, :social, cause: cause) }
  let(:user) { create(:user) }
  let(:follower) { proxy.new(user,need).fulfill! }


  let(:campaign) do
    campaign = cause.active_campaign
    campaign.update_attributes(:desired_state=>"20")
    campaign
  end

  it "should know how many days to go" do
    campaign.end_date = 5.days.from_now
    campaign.days_to_go.should == 5
  end

  describe "Incrementing Progress" do
    it "should be accessible from the fulfillment object" do
      follower.related_campaign.should be_present
    end

    it "should increment the campaign progress" do
      follower.should be_valid
      campaign.current_state.should == "1"
    end
  end
end

