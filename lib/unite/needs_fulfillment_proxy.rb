module Unite
  # The NeedsFulfillmentProxy is responsible for creating the records
  # that fulfill the needs of a given Cause.  For example, if a Cause
  # needs CashDonations, then it will kick off the creation of a
  # donation.
  class NeedsFulfillmentProxy
    attr_accessor :need, :user, :params

    def initialize(user, need,params={})
      @need     = need
      @user     = user
      @params   = params.symbolize_keys
    end

    def fulfill!
      meth = "fulfill_#{ type_of_need }_need"
      object = send(meth) if respond_to?(meth)
      object
    end

    protected

      def type_of_need
        params[:type] || params[:type_of_need] || (need && need.type_of_need)
      end

      def cause
        @cause ||= need.present? ? need.cause : Cause.find(params[:cause_id])
      end

      def fulfill_cash_donations_need
        tip_amount = params[:donation_tip] 
        donation_amount=params[:donation_amount] 
        stripe =params[:stripeToken] 

        # This will authorize the card and only run the block
        # if the authorization is true. The CashDonation model
        # should only capture the successful donation, not the entire
        # transaction itself.
        Unite::PaymentGatewayService.authorize_card(params) do
          cause.cash_donations.create(need_id: need.try(:id),
                                      user_id: user.try(:id),
                                      stripe_id: stripe,
                                      tip_amount: tip_amount,
                                      amount: donation_amount) #in cents
        end
      end

      def fulfill_volunteers_need
        cause.volunteers.create(need_id: need.try(:id), user_id: user.try(:id), name: params.try(:name), email: params.try(:email), availability: params.try(:availability), description: params.try(:description) )
      end

      def fulfill_goods_donations_need
        cause.goods_donations.create(need_id: need.try(:id), user_id: user.try(:id),name: params.try(:name), phone_number: params.try(:phone_number), email: params.try(:email))
      end

      def fulfill_followers_need
        cause.followers.create(need_id: need.try(:id), user_id: user.try(:id))
      end

  end
end
