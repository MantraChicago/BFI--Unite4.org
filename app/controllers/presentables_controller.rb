class PresentablesController < ApplicationController
  include Smooth::Presentable::Controller

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
