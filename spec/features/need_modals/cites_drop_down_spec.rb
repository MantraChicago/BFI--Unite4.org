require 'spec_helper'
require 'capybara/rspec'

describe 'cites_drop_down', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end

  let(:cause) { create(:cause) }

  let(:goods_need) { create(:need, :goods, cause: cause)}

  it 'Find causes modal should open' do

    login_as(@user, :scope => :user)
    modal_title = 'What are you passionate about'
    visit "/"
    find("#causes_nav").click
    sleep 5
    page.should have_content modal_title
    find("a.close-reveal-modal").click
    page.should_not have_content modal_title
  end
end
