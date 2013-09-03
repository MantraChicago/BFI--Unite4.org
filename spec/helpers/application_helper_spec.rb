require "spec_helper"

describe ApplicationHelper do
  context 'get_array_of_badges' do 
    it 'should get correct array for user_badges' do
      Badge.create_defaults
      badge_getting_out_there = Badge.find_by_slug('getting_out_there')
      badge_keeping_tabs = Badge.find_by_slug('keeping_tabs')
      user = FactoryGirl.create :user
      cause = FactoryGirl.create :cause
      Unite::Badges::BadgeCalculator::BaseBadgeCalculator.create_badge_for_user(badge_getting_out_there,user,:cause_id => cause.id)
      Unite::Badges::BadgeCalculator::BaseBadgeCalculator.create_badge_for_user(badge_keeping_tabs,user,:cause_id => cause.id)
      
      ret_array=get_array_of_badges user
      ret_array.count.should == Badge.all.count
    end
  end
end