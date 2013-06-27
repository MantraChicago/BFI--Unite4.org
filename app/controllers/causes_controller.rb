class CausesController < ApplicationController
	respond_to :html

	def index
	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
