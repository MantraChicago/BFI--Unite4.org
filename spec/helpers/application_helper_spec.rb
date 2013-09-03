require "spec_helper"

describe ApplicationHelper do
  context 'render_badges' do 
    before :each do
      Badge.create_defaults
      badge = Badge.find_by_slug('getting_out_there')
      @user = FactoryGirl.create :user
      cause = FactoryGirl.create :cause
      Unite::Badges::BadgeCalculator::BaseBadgeCalculator.create_badge_for_user(badge,@user,:cause_id => cause.id)
    end
    
    it 'should get correct array for user_badges' do 
      render_badges @user
    end
  end
end