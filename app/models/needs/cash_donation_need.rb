class CashDonationNeed < Need
  def properties
    {
      call_to_action:'Donate money',
      singular_name: 'Cash Donation',
      past_personal_action:'I donated money',
      past_action:'Donated',
      color:'green',
      img_path: '/causes/ui/need_icons/cash_donations.png'
    }
  end

  def stat_info
    total_donations = contributions.all.inject(0) {|total,contribution| total+contribution.fulfillment.amount }
    "Received $#{total_donations} in cash donations"
  end

  def create_fullfilment(user, params)
    tip_amount = params[:donation_tip] 
    donation_amount=params[:donation_amount] 
    stripe =params[:stripeToken] 

    # This will authorize the card and only run the block
    # if the authorization is true. The CashDonation model
    # should only capture the successful donation, not the entire
    # transaction itself.
    Unite::PaymentGatewayService.authorize_card(params) do
      cause.cash_donations.create(need_id: id,
                                  user_id: user.id,
                                  stripe_id: stripe,
                                  tip_amount: tip_amount,
                                  amount: donation_amount) #in cents
    end
  end
   
end