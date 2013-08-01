require 'spec_helper'
require 'capybara/rspec'


describe 'needs_modal', :js =>true do 
  include Devise::TestHelpers

  it 'User should have to be logged in to see need modal' do
    cause = FactoryGirl.create(:cause)
    cause.needs << FactoryGirl.create(:need, :social)
    cause.save!
    visit "/causes/#{cause.slug}"
    first('a.open-fulfillment-modal', :text => 'Followers').click
    
    expect(page).to have_content 'You need to be logged in to help a cause.'

  end

  it 'The social need should open' do
    @user = Factory.create(:user)
    sign_in @user
    
    cause = FactoryGirl.create(:cause)
    cause.needs << FactoryGirl.create(:need, :social)
    cause.save!
    visit "/causes/#{cause.slug}"
    first('a.open-fulfillment-modal', :text => 'Followers').click
    
    expect(page).to have_content 'You need to be logged in to help a cause.'

  end

end