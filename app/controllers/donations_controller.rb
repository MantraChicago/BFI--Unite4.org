class DonationsController < ApplicationController
	def new
		if not current_user
			session["user_return_to"] = request.url
			redirect_to new_user_registration_path, :notice => "You need to have an account to give a donation." 
		end
		@donation_need= DonationsNeed.find(params[:donations_need_id])
		@donation= Donation.new
	end

	def create
		@donation=Donation.new( params[:donation])
		donation_need=DonationsNeed.find(params[:donation][:donations_need_id])
		if @donation.save
	    	recordAction('New donation',@donation.attributes)
	    	redirect_to donation_need.cause, :notice => "Thank You for your donation"
		else
			render :action => "new" 
		end
	end

end
