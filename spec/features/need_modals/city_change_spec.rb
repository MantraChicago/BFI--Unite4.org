require 'spec_helper'
require 'capybara/rspec'

describe 'cite_change', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  
  it 'Should change your current city' do

    login_as(@user, :scope => :user)
    modal_title = 'Miami'
    visit "/cities"
    click_link("Miami")
    sleep 2
    find("a.popover_tigger").should have_content modal_title
  end
end