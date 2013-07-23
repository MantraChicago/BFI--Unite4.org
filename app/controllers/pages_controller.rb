class PagesController < ApplicationController
	def index
    @featured_causes_hash= Cause.featured_causes
  end
end
