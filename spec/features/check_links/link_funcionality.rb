require 'spec_helper'
require 'capybara/rspec'

feature "Check all links"
	scenario "Home Page"
		visit("/")
		find(:xpath, "//a[@href='/']").click
		find(:xpath, "//a[@href='/users/sign_up']").click
		visit("/")
		find(:xpath, "//a[@href='/users/sign_in']").click
		
		cities = ["/charities-in-chicago", "/charities-in-new-york", "/charities-in-san-francisco"]
		cities.each do |c|
		visit("/")
		find(:xpath, "//a[@href='c']").click
		end
		
		visit("/")
		list = ["Education", "Social Equality", "Global Outreach", "Environmental", "Health & Wellness", "Youth", "Arts"]
		list.each do |n|
		find(:xpath, "//a[@data-type-name='n']").click
		end
		
		footerLinks = ["/charities-supporting-education", "/charities-supporting-social-equality", "/charities-supporting-global-outreach", "/charities-supporting-environmental",
		"/charities-supporting-health-wellness", "/charities-supporting-youth", "/charities-supporting-animal-welfare", "/charities-supporting-arts", "/charities-supporting-hunger",
		"/charities-supporting-environment", "/charities-supporting-religion", "/cause_applications/new", "/users/sign_up", "/page/jobs_Internships", "/subscribers/new",
		"/page/press", "/page/partners", "page/goals", "/page/terms_conditions", "/page/privacy_policy", "https://www.facebook.com/Unite4Good", "https://twitter.com/unite4good", 
		"/page/get_in_touch"]
		footerLinks.each do|f|
		visit("/")
		find(:xpath, "//a[@data-type-name='f']").click
		end
		
		
		
	end
end
	
	