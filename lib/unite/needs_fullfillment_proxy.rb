module Unite
  # The needs fullfillment proxy
  # records the fullfillment of a given need
  # by a user.Typically you would interface with it
  # via a Controller, or background worker.
  class NeedsFullfillmentProxy
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
