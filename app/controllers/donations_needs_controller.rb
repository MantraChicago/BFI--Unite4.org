class DonationsNeedsController < ApplicationController

	def show
		@donation_need=DonationsNeed.find(params[:id])
		@donation=Donation.new
	end
end
