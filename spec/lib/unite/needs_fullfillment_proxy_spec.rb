require "spec_helper"

describe Unite::NeedsFulfillmentProxy do
  describe "fulfilling various types of needs" do
    let(:user) { create(:user) }
    let(:cause) { create(:cause, skip_default_location: true) }

    let(:proxy) { Unite::NeedsFulfillmentProxy }

    it "should allow for following a cause without a need being specified" do
    end

    it "should create a follower for a social need" do
      need = create(:need, :social, cause: cause)
      follower = proxy.new(user, need).fulfill!

      follower.user.should == user
      follower.need.should == need
      follower.cause.should == cause
    end

    it "should creater a donation for a cash need" do
      need = create(:need, :cash, cause: cause)
      proxy.new(user, need, amount: 2500, donation_amount: 2500, tip_amount: 2500).fulfill!
      cash_donation = CashDonation.last

      cash_donation.need.should == need
      cash_donation.user.should == user
      cash_donation.amount.should == 2500
    end

    it "should create a goods donation for a goods need" do
      need = create(:need, :goods, cause: cause)
      
      test_name= Faker::Name.name
      test_email= Faker::Internet.email
      test_phone_number = Faker::PhoneNumber.phone_number

      proxy.new(user, need, description: "Canned Goods", name: test_name, email: test_email, phone_number: test_phone_number).fulfill!
      goods_donation = GoodsDonation.last

      goods_donation.need.should == need
      goods_donation.user.should == user
      goods_donation.name.should == test_name
      goods_donation.email.should == test_email
      goods_donation.phone_number.should == test_phone_number
    end

    it "should create a volunteer for a volunteers need" do
      need = create(:need, :volunteers, cause: cause)
      
      test_name= Faker::Name.name
      test_email= Faker::Internet.email
      test_phone_number = Faker::PhoneNumber.phone_number

      proxy.new(user, need, location: cause.locations.first, name: test_name, email: test_email, phone_number: test_phone_number).fulfill!
      
      volunteer = Volunteer.last
      volunteer.need.should == need
      volunteer.user.should == user
      volunteer.name.should == test_name
      volunteer.email.should == test_email
      volunteer.phone_number.should == test_phone_number
    end
  end
end
