class Api::ContributionsController < Api::ApiController
  before_filter :authenticate_user!

  def create
    render :json => {amount: params[:donation_amount], success:true,donation_tracking_code:"test-tracking-code"}, :status => 200
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
