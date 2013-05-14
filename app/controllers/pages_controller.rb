class PagesController < ApplicationController
	def index
		@subscribe = Subscribe.new
		@new_causes = Cause.order('created_at asc').limit(5);
		@featured_causes=Cause.find_all_by_is_featured(true);
		@recent_needs=getRecentNeeds.reverse.from(-3)
	end

	def getNewNeeds

	end


end
