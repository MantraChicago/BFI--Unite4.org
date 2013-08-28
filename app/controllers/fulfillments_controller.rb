class FulfillmentsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :js, :json, :html

  def create

    properties={type_of_need: need.type,
                cause_id: need.cause.id}.merge!(params)
    
    @fulfillment = fulfillment.new(current_user, need, properties).fulfill!

    respond_to do |format|
      format.js do
        render "#{ type_of_need }/create", :layout => false#include_layout?
      end

      format.html do
        if @fulfillment.valid?
          redirect_to(@fulfillment.cause, success: fulfillment_success_message )
        else
          redirect_to(@fulfillment.cause, error: fulfillment_error_message )
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
    def fulfillment_success_message
      "Success"
    end

    def fulfillment_error_message
      "Error"
    end

    def type_of_need
      need.type.underscore
    end

    def cause_id
      params[:cause_id] || cause.try(:id)
    end

    def fulfillment
      Unite::NeedsFulfillmentProxy
    end

    def cause
      need.cause
    end

    def need
      params[:need_id] && Need.find(params[:need_id])
    end

end
