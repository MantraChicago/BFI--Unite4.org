class CausesController < ApplicationController
	respond_to :html, :js

	def index
		#for map
		#@needs=Need.all
		#@causes= Cause.all
		#@locations=Location.all

    respond_with(@causes = Cause.query(params))
	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
