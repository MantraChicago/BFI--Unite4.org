class SocialNeedsController < ApplicationController
	def show
		@social_need=SocialNeed.find(params[:id])
	end
end
