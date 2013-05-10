class GoodNeedsController < ApplicationController
	def show
		@good_need=GoodNeed.find(params[:id])
	end

end
