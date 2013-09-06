class GoodsDonationNeed < Need
  def properties
    {
      singular_name: 'Good Donation',
      call_to_action:'Donate goods',
      past_personal_action:'Donated Goods to',
      past_action:'Donated',
      color:'pink',
      img_path: '/causes/ui/need_icons/goods_donations.png',
      goal_unit: 'Donations'
    }
  end

  def stat_info
    total_goods_donation = contributions.count
    "Found #{total_goods_donation} people who want to donate"
  end

  def create_fullfilment(user, params)
    cause.goods_donations.create(need_id: id, user_id: user.id, name: params[:name], phone_number: params[:phone_number], email: params[:email])
  end

end
