class FollowersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :js, :json, :html

  def create
    #pry
    @follower = fulfillment.new(current_user, need, type_of_need: "followers", cause_id: cause_id).fulfill!

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
    current_user.unfollow(cause)

    respond_to do |format|
      format.json do
        head :ok
      end
    end
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
      Need.where('cause_id' => cause.id).where('type_of_need' => 'followers').first
      #Need.find(params[:need_id])
    end

end
