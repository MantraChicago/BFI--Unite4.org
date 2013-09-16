class CityHubsController < ApplicationController
  respond_to :html, :js

  def show

    @city = City.find_by_slug(params[:city_slug])

    if params[:set_as_home_city]
       cookies[:closest_city_id]=@city.id
       @closest_city=@city
    end

    @cause_type = CauseType.find params[:cause_type_id] if params[:cause_type_id]
    @cause_type = CauseType.find_by_slug params[:cause_type_slug] if params[:cause_type_slug]  

    @causes ||= Cause.by_city_slug(@city[:slug])
    @causes= Cause.by_city_slug(@city[:slug]).by_cause_type(@cause_type.slug) if @cause_type

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
