class CategoryHubsController < ApplicationController
  respond_to :js, :html

  def show
    @cause_type = CauseType.find_by_slug(params[:by_cause_type])
    if @cause_type.nil?
      @cause_type = CauseType.first(offset: rand(CauseType.count))
    end
    @causes = @cause_type.causes.query(params)

    respond_with(@causes)
  end
end
