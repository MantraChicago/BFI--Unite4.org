class PresentablesController < ApplicationController
  include Smooth::Presentable::Controller

  def index
    results = base_scope.present(params).as(presenter_format).to(current_user_role)
    render :json => results.to_a, :root => false
  end
end
