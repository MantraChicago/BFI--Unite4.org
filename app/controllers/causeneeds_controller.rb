class CauseneedsController < ApplicationController

	def show
		@causeneed=Causeneed.find(params[:id])
	end
end
