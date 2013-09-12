require 'spec_helper'
require 'capybara/rspec'

describe 'search_destination', :js =>true do
  include Warden::Test::Helpers
  Warden.test_mode!
it 'goes through all city pages' do
  cities = City.active.all
   cities.each do |city|


    page_title = city.name
    visit "/"
    select city.slug, :from => find("#city")
    click_button('Search')
    page.should have_content page_title

    end
  end
end