class CategoryHubsController < ApplicationController
  respond_to :js, :html

  def show
    @cause_type = CauseType.find_by_slug(params[:by_cause_type])
    if @cause_type.nil?
      @cause_type = CauseType.first(offset: rand(CauseType.count))
    end
    
    @causes ||= Cause.by_cause_type(@cause_type[:slug]).query(params)
Rails.logger.info "Rendering #{ @causes.length } causes"
    if params[:partial] and html?
      render :partial => "category_hubs/partials/cause_listings"
    else
      respond_with(@causes)
    end
  end
end

=begin
def show
    @city = City.find_by_slug(params[:city_slug])

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
=end