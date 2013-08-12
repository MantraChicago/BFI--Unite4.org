class UsersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def show
    respond_with(current_user.present_as(:profile))
  end
end


