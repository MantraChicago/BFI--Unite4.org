class DonationsController < ApplicationController
	def new
		@donation_need= DonationsNeed.find(params[:donations_need_id])
		@donation= Donation.new
	end

	def create
		@donation=Donation.new( params[:donation])
		if @donation.save
	    	recordAction('New donation')
		else
			render :action => "new" 
		end
	end

end
