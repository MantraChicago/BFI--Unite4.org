[
  Cause,
  Campaign,
  Need,
  FeaturedCause
].each &:delete_all


causeTypes=[
	"Arts", 
	'Education' ,
	'Environment' ,
	'Health & Wellness' ,
	'Youth' ,
	'Religion' ,
	'Global Outreach',
	'Social Equality']
CauseType.delete_all
causeTypes.each do |type|
	CauseType.find_or_create_by_name(type)
end

cities=[
	'Chicago',
	'New York City',
	'San Francisco']
City.delete_all
cities.each do |name|
	City.find_or_create_by_name(name)
end


gameBadges=[{name: 'Complete profile', file_name:'', accomplishment: "level_0"},
			{name: 'Watch Video', file_name:'', accomplishment: "level_1"},
			{name: 'Share with friends', file_name:'',accomplishment: "level_2"}
			]
gameBadges.each do |badgeObj|
	badge=Badge.find_or_create_by_accomplishment badgeObj[:accomplishment]
	badge.update_attributes badgeObj
end

5.times.each do
  Factory.create(:cause)
end

Cause.all.each do |cause|
  FeaturedCause.create(cause:cause)
end

