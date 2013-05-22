class CausesController < ApplicationController
	def index
		@causes= Cause.find(:all)
		@locations= Location.find(:all)
		@donation_needs = DonationsNeed.find(:all)
		@good_needs = GoodNeed.find(:all)
		@volunteer_needs = VolunteerNeed.find(:all)
		@social_needs = SocialNeed.find(:all)
	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])

	end

	
end
