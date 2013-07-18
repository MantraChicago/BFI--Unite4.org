class Unite::PaymentGatewayService
  def self.charge(stripe_token, amount, message)
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