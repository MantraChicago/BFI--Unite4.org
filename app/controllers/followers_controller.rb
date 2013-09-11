class FollowersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :js, :json, :html

  def create

    current_user.follow(cause)

    respond_to do |format|
      format.js do
        render
      end

      format.html do
        redirect_to(cause, success:"You are now following #{ cause.name }")
      end
    end
  end

  def destroy
    cause=Cause.find(params[:cause_slug])
    current_user.unfollow(cause)
    
    redirect_to(cause, success:"You unfollowed #{cause.name }")
  end

  protected
    def cause_id
      params[:cause_id] || cause.try(:id)
    end


    def cause
      if params[:cause_id]
        return Cause.find(params[:cause_id])
      end

      if params[:cause_slug]
        return Cause.find_by_slug(params[:cause_slug])
      end
    end

end
