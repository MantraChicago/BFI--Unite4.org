require 'spec_helper'
require 'capybara/rspec'


describe 'needs_modal', :js =>true do 
  include Warden::Test::Helpers
  Warden.test_mode!

  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end

  it 'User should have to be logged in to see need modal' do
    logout(:user)
    
    social_need = FactoryGirl.create(:follower_need)

    visit "/causes/#{social_need.cause.slug}"
    first("[data-need-id='#{social_need.id.to_s}'}").click
    sleep 1 #waiting for modals to appear 
    page.should have_content 'You need to be logged in'

  end


  

end