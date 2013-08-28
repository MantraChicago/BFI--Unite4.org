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

  let(:goods_need) { create(:need, :goods, cause: cause)}

  it 'The cash donation modal should open' do

    login_as(@user, :scope => :user)
    goods_need= create(:need, :goods, cause: cause)

    visit "/causes/#{goods_need.cause.slug}"

    first('[data-type-of-need="goods_donations"]').click
    modal_title='Thank you for your interest in donating goods'
    sleep 2 #waiting for modals to appear

    find(:xpath, "//a[@class='btn pink button-next']").click
    test_name = "tester"
    fill_in 'name', with: test_name
    test_phone_number = "555-555-5555"
    fill_in 'phone_number', with: test_phone_number
    find("[class='btn pink button-submit pink']").click

    find('#modalWrapper .close-reveal-modal').click
    sleep 1 #waiting for modals to appear
    page.should_not have_content modal_title

  end
end
