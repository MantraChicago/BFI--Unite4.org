require 'spec_helper'
require 'capybara/rspec'

describe 'goods_donation_modal', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end

  let(:cause) { create(:cause) }

  let(:goods_need) { create(:need, :goods, cause: cause)}

  it 'The goods donation modal should open' do

    login_as(@user, :scope => :user)
    goods_need= create(:goods_donation_need, cause: cause)

    visit "/causes/#{goods_need.cause.slug}"

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
    last_goods_donation = GoodsDonation.last
    last_goods_donation.name.should == test_name
    last_goods_donation.phone_number.should == test_phone_number
  end
end
