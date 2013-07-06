class CausesController < ApplicationController
	respond_to :html, :js

	def index
    respond_with(@causes = Cause.query(params))
	end

	def need
		@cause = Cause.find(params[:id])
	end

	def show
		@cause = Cause.find(params[:id])
	end
end
