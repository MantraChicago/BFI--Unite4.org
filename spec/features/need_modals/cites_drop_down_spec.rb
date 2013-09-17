=begin Commented out for until frontend redesign
require 'spec_helper'
require 'capybara/rspec'

describe 'cities_drop_down', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  
  it 'Cities Drop Down should open' do

    login_as(@user, :scope => :user)
    modal_title = 'Browse All Cities'
    visit "/"
    find("a.popover_tigger").click
    sleep 2
    page.should have_content modal_title
    find("a.popover_tigger").click
    page.should_not have_content modal_title
  end
end
=end