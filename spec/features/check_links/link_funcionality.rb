require 'spec_helper'
require 'capybara/rspec'

def check_footer_links
		footerLinks = ["/charities-supporting-education", "/charities-supporting-social-equality", "/charities-supporting-global-outreach", "/charities-supporting-environmental",
		"/charities-supporting-health-wellness", "/charities-supporting-youth", "/charities-supporting-animal-welfare", "/charities-supporting-arts", "/charities-supporting-hunger",
		"/charities-supporting-environment", "/charities-supporting-religion", "/cause_applications/new", "/users/sign_up", "/page/jobs_Internships", "/subscribers/new",
		"/page/press", "/page/partners", "page/goals", "/page/terms_conditions", "/page/privacy_policy", "/page/get_in_touch"]
		footerLinks.each do|f|
		visit("/")
		find(:xpath, "//a[@data-type-name='f']").click
end

def check_cause_pages
		causeLinks = ["/charities-supporting-education", "/charities-supporting-social-equality", "/charities-supporting-global-outreach", "/charities-supporting-environmental",
		"/charities-supporting-health-wellness", "/charities-supporting-youth", "/charities-supporting-animal-welfare", "/charities-supporting-arts", "/charities-supporting-hunger",
		"/charities-supporting-environment", "/charities-supporting-religion"]
		causeLinks.each do |l|
		visit 'l'
		checkFooterLinks()

end



feature "Check all links" do
	scenario "Home Page" do
		visit("/")
		find(:xpath, "//a[@href='/']").click
		find(:xpath, "//a[@href='/users/sign_up']").click
		visit("/")
		find(:xpath, "//a[@href='/users/sign_in']").click
		sleep 4

		#Go to city pages
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

		#Go to footer and come back to main page, go to next footer, repeat
		checkFooterLinks()
		end

	
	scenario "Chicago Page" do
	
	#Code to be inserted
	checkFooterLinks()
	end
	
	scenario "New York Page while under construction" do
	page.should have_content 'Coming Soon'
	checkFooterLinks()
	end
	
	scenario "San Francisco Page while under construction" do
	page.should have_content 'Coming Soon'
	checkFooterLinks()
	end
	
	scenario "Check all cause pages" do
	

	checkCausePages()

	end

	
	scenario "Checks cause pages" do
	

		cause= FactoryGirl.create :cause
  		visit(cause)

	end

	

