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
    cause = FactoryGirl.create(:cause)
    cash_donations_need= FactoryGirl.create(:need, :cash)
    cash_donations_need.cause_id=cause.id
    cause.needs << cash_donations_need
    cause.save!
    goods_need= FactoryGirl.create(:need, :goods)
    goods_need.cause_id=cause.id
    cause.needs << goods_need
    cause.save!
    social_need= FactoryGirl.create(:need, :social)
    social_need.cause_id=cause.id
    cause.needs << social_need
    cause.save!
    volunteers_need= FactoryGirl.create(:need, :volunteers)
    social_need.cause_id=cause.id
    cause.needs << social_need
    cause.save!

    visit "/causes/#{cash_donations_need.cause.slug}"
    binding.pry
    first('[data-type-of-need="cash_donations"]').click
    modal_title='Thank you for your interest in donating your money'
    sleep 1 #waiting for modals to appear 
    page.should have_content modal_title

    fill_in 'donation_amount', :with => '20'
    fill_in 'donation_tip', :with => '5'

    expect('total').to have_content '$25'

    visit "/causes/#{goods.cause.slug}"

    find('#modalWrapper .close-reveal-modal').click
    sleep 1 #waiting for modals to appear 
    page.should_not have_content modal_title
  end
end
