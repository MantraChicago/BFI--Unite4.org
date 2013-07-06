class CategoryHubsController < ApplicationController
  def show
    @cause_type = CauseType.find_by_slug(params[:cause_type_slug])
  end
end
