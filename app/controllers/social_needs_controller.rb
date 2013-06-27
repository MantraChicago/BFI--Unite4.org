class SocialNeedsController < ApplicationController
	def index
		@social_need=SocialNeed.find(params[:id])
	end
end
