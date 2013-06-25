class CausesController < ApplicationController
	respond_to :html

	def index
		conditions={}
		
		@causes = Cause.all(:include => :cause_types, :conditions=>conditions)

	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
