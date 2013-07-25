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

  Badge.create_defaults(true)

end
