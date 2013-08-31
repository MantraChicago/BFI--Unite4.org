class FollowersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :js, :json, :html

  def create
    #pry
    @follower = fulfillment.new(current_user, need).fulfill!

    respond_to do |format|
      format.js do
        render
      end

      format.html do
        if @follower.valid?
          redirect_to(@follower.cause, success:"You are now following #{ @follower.cause.name }")
        else
          redirect_to(@follower.cause, error:"An error occurred while attempting to follow this cause.")
        end
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

    def fulfillment
      Unite::NeedsFulfillmentProxy
    end

    def cause
      if params[:cause_id]
        return Cause.find(params[:cause_id])
      end

      if params[:cause_slug]
        return Cause.find_by_slug(params[:cause_slug])
      end
    end

    def need
      Need.where('cause_id' => cause.id).where('type' => 'FollowerNeed').first
    end

end
