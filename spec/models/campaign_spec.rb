require "spec_helper"

describe Campaign do
  let(:cause) { create(:cause, :skip_default_location => true) }
  let(:campaign) { cause.active_campaign }

  it "should know how many days to go" do
    campaign.end_date = 5.days.from_now
    campaign.days_to_go.should == 5
  end
end

