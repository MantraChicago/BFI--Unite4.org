class CityHubsController < ApplicationController
  respond_to :html, :js

  def show

    @city = City.find_by_slug(params[:city_slug])

    if params[:set_as_home_city]
       cookies[:closest_city_id]=@city.id
       @closest_city=@city
    end

    @causes ||= Cause.by_city_slug(@city[:slug]).query(params)

    Rails.logger.info "Rendering #{ @causes.length } causes"

    if params[:partial] and html?
      render :partial => "city_hubs/partials/cause_listings"
    else
      respond_with(@causes)
    end
  end

  protected

    def html?
      params[:format] == "html"
    end

end
