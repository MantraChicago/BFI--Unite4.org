class CausesController < ApplicationController
	respond_to :html

	def index
		@causes 		= Cause.scoped
		@locations 	= Location.scoped
		@needs 			= Need.scoped

		@needs.each do |need|
			need.type=need.type
		end

		render :layout => "application"
	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
