class PagesController < ApplicationController
	def index
    @featured_cause= Cause.where('is_featured',true).order("RANDOM()").first
  end
end
