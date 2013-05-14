class PagesController < ApplicationController
	def index
		@subscribe = Subscribe.new
		@new_causes = Cause.order('created_at asc').limit(5);

	end


end
