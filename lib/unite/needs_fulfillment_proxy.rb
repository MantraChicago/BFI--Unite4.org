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

    end

  end
end
