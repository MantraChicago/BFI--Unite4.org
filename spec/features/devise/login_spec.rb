=begin Commented out for until frontend redesign
require 'spec_helper'
require 'capybara/rspec'


describe 'devise', :js =>true do 
  before :all do
    CauseType.create_defaults
    @user = FactoryGirl.create(:user)
  end

  it 'Login modal should open when click login' do
    visit '/'
    find('.login_button').click
    sleep 2 #waiting for modals to appear 
    page.should have_content 'Login to your account'
  end

  it 'Login through modal should login successfully' do
    visit_path = '/'
    visit visit_path
    find('.login_button').click

    page.should have_content 'Login to your account'

    fill_in('email', :with => @user.email)
    fill_in('password', :with => @user.password)

    find('.btn.login_button').click
    sleep 2

    page.should have_content 'Signed in successfully'

  end
  

end
=end