class CausesController < ApplicationController
	def index
		@causes= Cause.find(:all)
		
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
