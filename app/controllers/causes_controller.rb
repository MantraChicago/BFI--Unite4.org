class CausesController < ApplicationController
	def index
		@causes= Cause.find(:all)
		@locations= Location.find(:all)
		@donation_needs = DonationsNeed.find(:all)
		@goods_needs = GoodNeed.find(:all)
		@volunteer_needs = VolunteerNeed.find(:all)
		@social_needs = SocialNeed.find(:all)
	end

	def show
		@cause = Cause.find(params[:id])
		@allNeeds= @cause.allNeeds

	end

	
end
