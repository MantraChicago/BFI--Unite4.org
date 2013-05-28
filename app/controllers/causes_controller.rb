class CausesController < ApplicationController
	def index
		@causes= Cause.find(:all)
		@locations= Location.find(:all)
		@needs = Need.find(:all)
		logger.debug @needs[0].to_json
		
		@needs.each do |need|
			need.type=need.type
		end
=begin
		@donation_needs = DonationsNeed.find(:all)
		@good_needs = GoodNeed.find(:all)
		@volunteer_needs = VolunteerNeed.find(:all)
		@social_needs = SocialNeed.find(:all)
=end
	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])

	end

	
end
