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
      @params   = params

    end

    def fulfill!
      meth = "fulfill_#{ type_of_need }_need"
      object = send(meth) if respond_to?(meth)
      
      object.update_campaign if object.valid? && object.respond_to?(:update_campaign)

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

        cash_donation=cause.cash_donations.create(need_id: need.try(:id), user_id: user.try(:id),stripe_id: params[:stripeToken], tip_amount: params[:donation], amount: params[:donation_amount])
        CauseMailer.new_cash_donation(cause, cash_donation).deliver
        cash_donation
      end

      def fulfill_volunteers_need
        volunteer = cause.volunteers.create(need_id: need.try(:id), user_id: user.try(:id))
        CauseMailer.new_volunteer(cause, volunteer).deliver
        volunteer
      end

      def fulfill_goods_donations_need
        good_donation=cause.goods_donations.create(need_id: need.try(:id), user_id: user.try(:id),description: params[:description])
        CauseMailer.new_good_donation(cause, good_donation).deliver
        good_donation
      end

      def fulfill_followers_need
        cause.followers.create(need_id: need.try(:id), user_id: user.try(:id))
      end

  end
end
