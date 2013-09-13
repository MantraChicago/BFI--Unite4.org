

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
    
    first('a.btn.green.open-fulfillment-modal').click
    modal_title='Thank you for your interest in donating money'

    sleep 2 #waiting for modals to appear 

    page.should have_content modal_title
    
    page.all('div.money_input_holder')[0].set('20')
    page.all('div.money_input_holder')[1].set('5')
    binding.pry
    expect('total').to have_content '$25'

    find('#modalWrapper .close-reveal-modal').click
    sleep 1 #waiting for modals to appear 
    page.should_not have_content modal_title

  end
end
