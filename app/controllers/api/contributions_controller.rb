class Api::ContributionsController < Api::ApiController
  #before_filter :authenticate_user!

  def create
    #render :json => {amount: params[:donation_amount], success:true,donation_tracking_code:"test-tracking-code"}, :status => 200
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

  protected
    def cause
      @cause ||= Cause.find(params[:cause_id])
    end

    def donation_params
      params.slice(:stripe_token,:donation_amount,:tip_amount)
    end

    def cash_donation_need
      cause.needs.where(:type_of_need=>"cash_donations").first
    end
end
