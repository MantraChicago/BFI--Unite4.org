class PromotionNeed < Need
  def properties
    {
      call_to_action:'Promote',
      singular_name: 'Promoter',
      past_personal_action:'Promoted',
      past_action:'Promoted',
      color:'blue',
      img_path: '/causes/ui/need_icons/followers.png',
      goal_unit: 'Promotions'
    }
  end

  def stat_info
    total_new_followers= contributions.count
    "Received #{total_new_followers} new followers"
  end

  def create_fullfilment(user, params)
    cause.promotions.create(need_id: id, user_id: user.id, message: params[:message], method: params[:method])
  end
   
end