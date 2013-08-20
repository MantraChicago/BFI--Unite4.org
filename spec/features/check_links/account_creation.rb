require 'spec_helper'
require 'capybara/rspec'

def create_account name, last_name, password
	within(find_form "#registration_new form") do
	fill_in "user_first_name" :with => name
	fill_in "user_last_name" :with => last_name
	fill_in "user_password" :with => "#{rand(100)}+test@example.com"
	fill_in "user_password_confirmation" :with => password
	tab_out
end

def log_in email, password
	within(find_form "#pages_index form") do
	fill_in "user_email" :with => email
	fill_in "user_password" :with => password
	tab_out
end

feature "Account creation, useage tests"
	scenario "Create account"
	visit 'users/sign_up'
	create_account "test", "last", "1234567890"
	find("Create my free account").click
	sleep 5
	page.should have_content 'Welcome! You have signed up successfully.'
	end
	
	scenario "Log in"
	find('.login_button').click
    sleep 2 #waiting for modals to appear 
    page.should have_content 'Sign in to your account'
	log_in testtest@example.com, meetmantra
	end
	
end