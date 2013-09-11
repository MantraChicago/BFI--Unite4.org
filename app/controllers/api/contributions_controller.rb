class Api::ContributionsController < Api::ApiController
  def create
    need=Need.find(params[:need_id])
    user = User.find(params[:user_id])
    properties={type_of_need: need.type,
                cause_id: need.cause.id}.merge!(params)
    
    @fulfillment = Unite::NeedsFulfillmentProxy.new(user, need, properties).fulfill!
    if ! @fulfillment.errors.empty?
      render json: @fulfillment.errors, :status => 500
    else
      render json: @fulfillment
    end
  end
end