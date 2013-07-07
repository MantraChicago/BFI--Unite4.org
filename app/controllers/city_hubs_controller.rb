class CityHubsController < ApplicationController
  respond_to :html, :js

  def show
    @city = City.find_by_slug(params[:city_slug])
    @causes = Cause.by_city_slug(params[:city_slug]).query(params)

    respond_with(@causes)
  end

end
