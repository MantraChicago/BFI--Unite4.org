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
    page.all('a.current')[1].click
    within(page.all('ul')[4]) {
      puts all('li')
    select(page_title)
     }
    click_button('Search')
    page.should have_content page_title

    end
  end
end