class VolunteersController < ApplicationController
	def create
		@volunteer=Volunteer.new()
		if params[:volunteer]
			@volunteer.update_attributes params[:volunteer]
		end
	end
end
