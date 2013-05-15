class VolunteersController < ApplicationController
	def new
		@volunteer_need=VolunteerNeed.find(params[:volunteer_need_id])
		@volunteer=Volunteer.new


	end

	def create
		@volunteer=Volunteer.new(params[:volunteer])
		@volunteer_need=VolunteerNeed.find(params[:volunteer][:volunteer_need_id])
		if @volunteer.save
			recordAction("New volunteer")
	      	redirect_to volunteer_need_path(@volunteer_need), :notice => "You have successfully applied to be a volunteer" 
	    else
	      
	      render :new
   		end

	end
end
