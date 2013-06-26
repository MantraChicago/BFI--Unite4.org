
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

cities=[
	'Chicago',
	'New York City',
	'San Francisco']

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


