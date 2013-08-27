class Unite::PaymentGatewayService
  def self.authorize_card(params={},&blk)
    # TODO
    # Implement the logic which authorizes a card and if it is successful
    # then yield the transaction id or response object or something to a block
    yield if block_given?
  end

  def self.charge(stripe_token, amount, message)
    # This should be better
    return nil if Rails.env.test?

    Stripe.api_key = SimpleSettings.config[:stripe][:private_key]

    #sometimes we get an array from Stripe
    if stripe_token.kind_of?(Array)
      stripe_token=stripe_token.pop
    end

    begin
      charge = Stripe::Charge.create(
        :amount => amount, # amount in cents, again
        :currency => "usd",
        :card => stripe_token,
        :description => message
      )
      return charge
    rescue Stripe::CardError => e
      return false
    end


  end

  
end
