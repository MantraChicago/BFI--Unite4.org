class PromotionNeed < Need
  def properties
    {
      call_to_action:'Volunteer',
      singular_name: 'Volunteer',
      past_personal_action:'I volunteered',
      past_action:'Volunteered',
      color:'black',

    }
  end

  def create_fullfilment(user, params)

  end

end