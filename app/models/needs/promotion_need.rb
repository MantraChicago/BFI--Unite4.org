class PromotionNeed < Need
  def properties
    {
      call_to_action:'Spread the word',
      singular_name: 'Promote',
      past_personal_action:'Promoted',
      past_action:'Promoted',
      color:'black',
      img_path: '/causes/ui/need_icons/volunteers.png',
      goal_unit: 'Promotions'
    }
  end

  def stat_info
    total_new_followers= contributions.count
    "Received #{total_new_followers} new promotions"
  end

  def create_fullfilment(user, params)
    cause.promotions.create(need_id: id, user_id: user.id, message: params[:message], method: params[:method])
  end
   
end