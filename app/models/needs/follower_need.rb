class FollowerNeed < Need
  def properties
    {
      call_to_action:'Follow',
      singular_name: 'Follower',
      past_personal_action:'I followed this cause',
      past_action:'Followed',
      color:'blue',
      img_path: '/causes/ui/need_icons/followers.png'
    }
  end

  def stat_info
    total_new_followers= contributions.count
    "Received #{total_new_followers} new followers"
  end

  def create_fullfilment(user, params)
    cause.followers.create(need_id: id, user_id: user.try(:id))
  end
   
end