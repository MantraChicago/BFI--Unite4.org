require "spec_helper"

describe Unite::NeedsFulfillmentProxy do
  describe "fulfilling various types of needs" do
    let(:user) { create(:user) }
    let(:cause) { create(:cause) }

    let(:proxy) { Unite::NeedsFulfillmentProxy }

    it "should create a follower for a social need" do
      need = create(:need, :social, cause: cause)
      proxy.new(need, user).fulfill!

      Follower.last.need.should == need
    end

    it "should creater a donation for a cash need" do
      need = create(:need, :cash, cause: cause)
      proxy.new(need, user, amount: 2500).fulfill!
      cash_donation = CashDonation.last

      cash_donation.need.should == need
      cash_donation.user.should == user
      cash_donation.amount.should == 2500
    end

    it "should create a goods donation for a goods need" do
      need = create(:need, :goods, cause: cause)
      proxy.new(need, user, description: "Canned Goods").fulfill!
      goods_donation = GoodsDonation.last

      goods_donation.need.should == need
      goods_donation.user.should == user
      goods_donation.description.should == "Canned Goods"
    end

    it "should create a volunteer for a volunteers need" do
      need = create(:need, :volunteers, cause: cause)
      proxy.new(need, user, location: cause.locations.first)
      volunteer = Volunteer.last
      volunteer.need.should == need
      volunteer.user.should == user
    end
  end
end
