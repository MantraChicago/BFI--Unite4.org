class CityHubsController < ApplicationController
  before_filter :set_scope

  respond_to :html, :js

  def show
    @city = City.find_by_slug(params[:city_slug])
    @causes = Cause.query(params)
  end

  protected

    def set_scope
      params[:scope] = [:by_city_slug, params[:city_slug]]
    end
end
