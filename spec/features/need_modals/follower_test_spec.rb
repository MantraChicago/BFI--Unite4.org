require 'spec_helper'
require 'capybara/rspec'

describe 'follower_test', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end

  let(:cause) { create(:cause) }

  @user = FactoryGirl.create(:cause)
  it 'Should follow' do

    login_as(@user, :scope => :user)
    visit "/causes/#{cause.slug}"

    first("[data-need-id='#{goods_need.id}']").click
    modal_title='Thank you for your interest in donating goods'
    sleep 2 #waiting for modals to appear

    find("a.btn.pink.button-next").click
    test_name = "tester"
    fill_in 'name', with: test_name
    test_phone_number = "555-555-5555"
    fill_in 'phone_number', with: test_phone_number
    find("[class='btn pink button-submit pink']").click
    sleep 2
  end
end
