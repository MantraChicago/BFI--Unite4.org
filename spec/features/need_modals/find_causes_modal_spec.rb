require 'spec_helper'
require 'capybara/rspec'

describe 'find_causes_modal', :js =>true do
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

    visit "/"
    page.should have_content modal_title
  end
end
