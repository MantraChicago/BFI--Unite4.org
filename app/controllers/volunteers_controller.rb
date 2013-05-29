	class VolunteersController < ApplicationController
	def new
		if not user_signed_in?
			session["user_return_to"] = request.url
			redirect_to new_user_registration_path, :notice => "You need to have an account to be a volunteer." 
		end
		@volunteer_need=VolunteerNeed.find(params[:volunteer_need_id])
		@volunteer=Volunteer.new


	end

	def create
		@volunteer=Volunteer.new(params[:volunteer])
		@volunteer_need=VolunteerNeed.find(params[:volunteer][:volunteer_need_id])
		if @volunteer.save
			recordAction("New volunteer", @volunteer.attributes)
	      	redirect_to @volunteer_need.cause, :notice => "You have successfully applied to be a volunteer" 
	    else
	      
	      render :new
   		end

	end
end
