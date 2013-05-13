class VolunteerNeedsController < ApplicationController

	def show
		@volunteer_need=VolunteerNeed.find(params[:id])
		@volunteer= Volunteer.new
	end

end
