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
      @need.create_fullfilment(@user,@params)

    end

  end
end
