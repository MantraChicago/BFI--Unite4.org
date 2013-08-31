require 'spec_helper'
require 'capybara/rspec'

describe 'cash_donation_modal', :js =>true do 
  include Warden::Test::Helpers
  Warden.test_mode!

  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end


  it 'The cash donation modal should open' do
      
    login_as(@user, :scope => :user)
    cash_donations_need= create(:cash_donation_need)

    visit "/causes/#{cash_donations_need.cause.slug}"
    
    first("[data-need-id='"+cash_donations_need.id.to_s+"']").click
    modal_title='ank you for your interest in donating money'
    sleep 2 #waiting for modals to appear 

    page.should have_content modal_title

    fill_in 'donation_amount', :with => '20'
    fill_in 'donation_tip', :with => '5'

    expect('total').to have_content '$25'

    find('#modalWrapper .close-reveal-modal').click
    sleep 1 #waiting for modals to appear 
    page.should_not have_content modal_title

  end
end
