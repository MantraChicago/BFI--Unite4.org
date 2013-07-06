class CityHubsController < ApplicationController
  before_filter :set_scope

  respond_to :html, :js

  def show
    @causes = Cause.query(params)
  end

  protected

    def set_scope
      params[:scope] = [:by_city_slug, params[:id]]
    end
end
