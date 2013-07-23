class PresentablesController < ApplicationController
  include Smooth::Presentable::Controller

  def index
    results = base_scope.present(params).as(presenter_format).to(current_user_role)
    render :json => results.to_a, :root => false
  end

  before_filter :set_user_id

  protected

    def set_user_id
      params[:user_id] = current_user.id if user_signed_in?
    end
end
