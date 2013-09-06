class VolunteerNeed < Need
  def properties
   {
      call_to_action:'Volunteer',
      singular_name: 'Volunteer',
      past_personal_action:"Expressed interest in volunteering with ",
      past_action:'Volunteered',
      color:'black',
      img_path: '/causes/ui/need_icons/volunteers.png',
      goal_unit: 'Volunteers'
    }
  end

  def stat_info
    total_volunteers= contributions.count
    "Received #{total_volunteers} volunteers contact information"
  end

  def create_fullfilment(user, params)
    cause.volunteers.create(need_id: id, user_id: user.id, name: params[:name], email: params[:email], availability: params[:availability], phone_number: params[:phone_number], description: params[:description])
  end
  
end