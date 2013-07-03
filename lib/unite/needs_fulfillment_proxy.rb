module Unite
  # The NeedsFulfillmentProxy is responsible for creating the records
  # that fulfill the needs of a given Cause.  For example, if a Cause
  # needs CashDonations, then it will kick off the creation of a
  # donation.
  class NeedsFulfillmentProxy
    attr_accessor :need, :user, :params

    def initialize(need, user,params={})
      @need     = need
      @user     = user
      @params   = params
    end

    def fulfill!
      meth = "fulfill_#{ need.type_of_need }_need"
      send(meth) if respond_to?(meth)
    end

    protected
      def cause
        @cause ||= need.cause
      end

      def fulfill_cash_donations_need
        cause.cash_donations.create(need_id: need.try(:id), user_id: user.try(:id), amount: params[:amount])
      end

      def fulfill_volunteers_need
        cause.volunteers.create(need_id: need.try(:id), user_id: user.try(:id))
      end

      def fulfill_goods_donations_need
        cause.goods_donations.create(need_id: need.try(:id), user_id: user.try(:id),description: params[:description])
      end

      def fulfill_followers_need
        cause.followers.create(need_id: need.try(:id), user_id: user.try(:id))
      end

  end
end
