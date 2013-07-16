class CausesController < ApplicationController
	respond_to :html, :js

	def index
		#for map
		#@needs=Need.all
		#@causes= Cause.all
		#@locations=Location.all

    respond_with(@causes = Cause.query(params))
	end

	def edit
		cause_id = params[:id] ||=params[:cause][:id]
	  @cause = Cause.find(params[:id])

	  if not request.get? and @cause.update_attributes(params[:cause]) 
	  	redirect_to @cause, :notice => "You have successfully updated your cause" 
	  end

	end

	

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
