class PresentablesController < ApplicationController
  respond_to :json

  def index
    results = resource_model.present(params).as(presenter_format).to(recipient_role)
    respond_with(results.to_a)
  end

  protected
    def presenter_format
      params[:presenter_format] || :default
    end

    def recipient_role
      (current_user && current_user.try(:role)) || "default"
    end

    def resource_model
      params[:resource].singularize.camelize.constantize
    end
end