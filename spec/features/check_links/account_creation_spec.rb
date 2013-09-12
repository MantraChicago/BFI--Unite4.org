require 'spec_helper'
require 'capybara/rspec'

describe 'Sign_up', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  
  it 'Signup' do

    visit "/users/sign_up"
    test_first_name = "tester"
    test_last_name = "McTesty"
    test_email = "test@example.com"
    test_password = "1234567890"
    fill_in 'user_first_name', with: test_first_name
    fill_in 'user_last_name' , with: test_last_name
    fill_in 'user_email' , with: test_email
    fill_in 'user_password' , with: test_password
    fill_in 'user_password_confirmation' , with: test_password
    find("input.btn.signup_button").click

    last_registered_user = User.last
    last_registered_user.first_name = test_first_name
    last_registered_user.last_name = test_last_name
    last_registered_user.email = test_email
  end
end