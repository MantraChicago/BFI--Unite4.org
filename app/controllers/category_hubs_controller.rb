class CategoryHubsController < ApplicationController
  respond_to :js, :html

  def show
    @cause_type = CauseType.find_by_slug(params[:by_cause_type])
    @causes = @cause_type.causes.query(params)

    respond_with(@causes)
  end
end
