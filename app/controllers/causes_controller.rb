class CausesController < ApplicationController
	respond_to :html, :js

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
		@current_model=@cause #for javascript presenation
	end
end
