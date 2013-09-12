require 'spec_helper'
require 'capybara/rspec'

describe 'cites_drop_down', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!

  
  it 'Signup' do

    visit "/users/sign_up"
  end
end