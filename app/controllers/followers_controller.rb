class FollowersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :js, :json, :html

  def create
    @follower = fulfillment.new(current_user, need, type_of_need: "followers", cause_id: params[:cause_id]).fulfill!

    respond_to do |format|
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

  end

  protected
    def fulfillment
      Unite::NeedsFulfillmentProxy
    end

    def cause
      params[:cause_id] && Cause.find(params[:cause_id])
    end

    def need
      params[:need_id] && Need.find(params[:need_id])
    end

end
