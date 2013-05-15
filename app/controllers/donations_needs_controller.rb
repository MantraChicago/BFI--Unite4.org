class DonationsNeedsController < ApplicationController

	def show
		
		@donations_need=DonationsNeed.find(params[:id])
	end

	

end
