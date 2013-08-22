require 'spec_helper'
require 'capybara/rspec'

describe 'cash_donation_modal', :js =>true do 
  include Warden::Test::Helpers
  Warden.test_mode!

  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end

  let(:cause) { create(:cause) }
  let(:cash_donations_need) { create(:need, :cash, cause: cause) }
  let(:goods_need) { create(:need, :goods, cause: cause)}
  let(:social_need) { create(:need, :social, cause: cause)}
  let(:volunteers_need) { create(:need, :volunteers, cause: cause)}

  it 'The cash donation modal should open' do
      
    login_as(@user, :scope => :user)
    cash_donations_need= create(:need, :cash, cause: cause)

    visit "/causes/#{cash_donations_need.cause.slug}"
    
    first('[data-type-of-need="cash_donations"]').click
    modal_title='ank you for your interest in donating money'
    sleep 2 #waiting for modals to appear 
    binding.pry
    page.should have_content modal_title

    fill_in 'donation_amount', :with => '20'
    fill_in 'donation_tip', :with => '5'

    expect('total').to have_content '$25'

    find('#modalWrapper .close-reveal-modal').click
    sleep 1 #waiting for modals to appear 
    page.should_not have_content modal_title

  end
end
