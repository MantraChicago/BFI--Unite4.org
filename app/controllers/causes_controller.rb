class CausesController < ApplicationController
	respond_to :html

	def index
		query= params.clone
		query.delete(:action)
		query.delete(:controller)
		
		@causes = Cause.query(query)

	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
