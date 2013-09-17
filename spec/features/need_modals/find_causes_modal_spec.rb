=begin Commented out for until frontend redesign
require 'spec_helper'
require 'capybara/rspec'

describe 'find_causes_modal', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  
  it 'Find causes modal should open' do

    login_as(@user, :scope => :user)
    modal_title = 'What are you passionate about'
    visit "/"
    find("#causes_nav").click
    sleep 2
    page.should have_content modal_title
    find("a.close-reveal-modal").click
    page.should_not have_content modal_title
  end
end
=end