unless Rails.env.production?

  causeTypes=[
    "Arts",
    'Education' ,
    'Environment' ,
    'Health & Wellness' ,
    'Youth' ,
    'Religion' ,
    'Global Outreach',
    'Social Equality']

  causeTypes.each do |type|
    CauseType.find_or_create_by_name(type)
  end

  gameBadges=
        [
          {name: 'Signed Up', file_name:'', accomplishment: "level_0"},
          {name: 'Complete Profile', file_name:'', accomplishment: "level_1"},
          {name: 'Watch Video', file_name:'', accomplishment: "level_2"},
          {name: 'Share with friends', file_name:'',accomplishment: "level_3"}
        ]

  gameBadges.each do |badgeObj|
    badge=Badge.find_or_create_by_accomplishment badgeObj[:accomplishment]
    badge.update_attributes badgeObj
  end


end
