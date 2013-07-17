class Unite::PaymentGatewayService
  def self.charge(stripe_token, amount, message)
    Stripe.api_key = SimpleSettings.config[:stripe][:private_key]
    # Create the charge on Stripe's servers - this will charge the user's card
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