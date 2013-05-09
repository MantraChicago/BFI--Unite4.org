class PagesController < ApplicationController
	def index
		@subscribe = Subscribe.new
	end


end
