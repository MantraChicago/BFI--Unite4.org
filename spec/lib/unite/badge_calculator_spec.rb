require "spec_helper"

describe Unite::Badges::BadgeCalculator do
  before :all do
   Badge.create_defaults
   @user=FactoryGirl.create(:user)
  end

  it 'A user should get the "sign_up" badge when they first sign up' do   
    badge = Badge.find_by_slug('sign_up')
    Unite::Badges::BadgeCalculator.calculate_badges_for_user(@user,Badge.all)
    @user.badges.include? badge

  end

  it 'A user should get the "keeping_tabs" badge after they follow a cause' do
    badge = Badge.find_by_slug('keeping_tabs')
    Unite::NeedsFulfillmentProxy.new(@user, FactoryGirl.create(:need, :social), type_of_need: "followers", cause_id: FactoryGirl.create(:cause)).fulfill!
    Unite::Badges::BadgeCalculator.calculate_badges_for_user(@user,Badge.all)
    @user.badges.include? badge
  end

  it 'A user should get the "doler_of_dollars" badge after doneate to a cause' do
    badge = Badge.find_by_slug('doler_of_dollars')
    Unite::NeedsFulfillmentProxy.new(@user, FactoryGirl.create(:need, :cash), type_of_need: "cash_donations", cause_id: FactoryGirl.create(:cause)).fulfill!
    Unite::Badges::BadgeCalculator.calculate_badges_for_user(@user,Badge.all)
    @user.badges.include? badge
  end

  it 'A user should get the "getting_out_there" badge after signup to volunteer' do
    badge = Badge.find_by_slug('getting_out_there')
    Unite::NeedsFulfillmentProxy.new(@user, FactoryGirl.create(:need, :volunteers), type_of_need: "volunteers", cause_id: FactoryGirl.create(:cause)).fulfill!
    Unite::Badges::BadgeCalculator.calculate_badges_for_user(@user,Badge.all)
    @user.badges.include? badge
  end

  it 'A user should get the "enthusiast" badge after they follow 5 causes' do
    badge = Badge.find_by_slug('enthusiast')
    
    5.times do 
      @user.causes << FactoryGirl.create(:cause)
    end

    Unite::Badges::BadgeCalculator.calculate_badges_for_user(@user,Badge.all)
    @user.badges.include? badge
  end

end