class DonationsController < ApplicationController
	def create
		@donation=Donation.new()
		if params[:donation]
			@donation.update_attributes params[:donation]
		end
	end

end
