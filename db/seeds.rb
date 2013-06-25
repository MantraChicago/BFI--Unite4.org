# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

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