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
    cause = FactoryGirl.create(:cause)
    cause.needs << FactoryGirl.create(:need, :social)
    cause.save!
    visit "/causes/#{cause.slug}"
    first('a.open-fulfillment-modal', :text => 'Followers').click
    sleep 1 #waiting for modals to appear 
    page.should have_content 'You need to be logged in'

  end

  it 'The social need modal should open' do
    
    login_as(@user, :scope => :user)

    cause = FactoryGirl.create(:cause)
    cause.needs << FactoryGirl.create(:need, :social)
    cause.save!
    visit "/causes/#{cause.slug}"
    first('a.open-fulfillment-modal', :text => 'Followers').click
    modal_title='Show your support'
    sleep 1 #waiting for modals to appear 
    page.should have_content modal_title

    find('#modalWrapper .close-reveal-modal').click
    sleep 1 #waiting for modals to appear 
    page.should_not have_content modal_title
  end

end