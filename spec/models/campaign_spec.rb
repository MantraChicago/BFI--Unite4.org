require "spec_helper"

describe Campaign do
  let(:cause) { create(:cause, :skip_default_location => true) }
  let(:proxy) { Unite::NeedsFulfillmentProxy }
  let(:need) { create(:need, :social, cause: cause) }
  let(:user) { create(:user) }

  let(:follower) { proxy.new(user,need).fulfill! }
  let(:more_followers) { 3.times { proxy.new(create(:user),need).fulfill! }}


  let(:campaign) do
    campaign = cause.active_campaign
    campaign.update_attributes(:desired_state=>20)
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
      more_followers
      follower.related_campaign.reload.current_state.should == 4
    end
  end
end

# == Schema Information
#
# Table name: campaigns
#
#  id                    :integer          not null, primary key
#  cause_id              :integer
#  need_id               :integer
#  start_date            :datetime
#  end_date              :datetime
#  percent_complete      :integer
#  desired_state         :string(255)
#  current_state         :string(255)
#  active                :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  type_of_need          :string(255)
#  goal_summary          :string(255)
#  timeframe_description :string(255)
#

