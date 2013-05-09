class CausesController < ApplicationController
	def index
		@causes= Cause.find(:all)
		
	end
end
