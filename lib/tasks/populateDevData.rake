task :createActiveAdminUser => [:environment] do
	AdminUser.create :email => 'eddie@meetmantra.com', :password => '12345678', :password_confirmation => '12345678'
	puts "Active Admin user created"
end


task :populateDevData => [:environment, 'db:seed'] do
	cause1 = Cause.find_or_create_by_name("PETA")
	cause1.update_attributes({ :cause_type_id =>CauseType.find_by_name(:Environmental).id,
							   :city => 'Chicago',
							   :state => 'IL',
							   :picture => File.open(Rails.root.to_s+'/lib/assets/default_images/cloths.jpg'),

							   :is_featured =>true,
							   :twitter_handle => 'PETA',
							   :video_link => "http://player.vimeo.com/video/27882235?color=ff9933" })

	cause2 = Cause.find_or_create_by_name("AIDS Foundation")
	cause2.update_attributes({ :cause_type_id =>CauseType.find_by_name(:Health).id,
							   :city => 'Chicago',
							   :state => 'IL',
							   :is_featured =>true,
							   :picture => File.open(Rails.root.to_s+'/lib/assets/default_images/sheep.jpg'),
							   :twitter_handle =>'AIDS',
							   :video_link => "http://player.vimeo.com/video/27882235?color=ff9933"  })

	cause3 = Cause.find_or_create_by_name("Habitat for Humanity")
	cause3.update_attributes({ :cause_type_id =>CauseType.find_by_name(:Social).id,
							   :city => 'Chicago',
							   :state => 'IL',
							   :is_featured =>true,
							   :picture => File.open(Rails.root.to_s+'/lib/assets/default_images/pray.jpg'),
							   :twitter_handle => 'Habitat',
							   :video_link => "http://player.vimeo.com/video/27882235?color=ff9933"  })

	location1= Location.find_or_create_by_name("ABC school")
	location1.update_attributes({:cause_id => cause1.id, 
								:latitude =>  41.85,  
								:longitude =>  -87.65 })

	location2= Location.find_or_create_by_name("ABC College")
	location2.update_attributes({:cause_id => cause1.id, 
								:latitude =>  42.85,  
								:longitude =>  -86.65 })

	location3= Location.find_or_create_by_name("Clinic")
	location3.update_attributes({:cause_id => cause1.id, 
								:latitude =>  44.85,  
								:longitude =>  -86.65 })

	location4 = Location.find_or_create_by_name("XYZ Clinic")
	location4.update_attributes({:cause_id => cause2.id, 
								:latitude =>  45.85,  
								:longitude =>  -84.65 })

	location5 = Location.find_or_create_by_name("Animal Clinc")
	location5.update_attributes({:cause_id => cause2.id, 
								:latitude =>  42.85,  
								:longitude =>  -84.65 })

	location6=Location.find_or_create_by_name("Hospital")
	location6.update_attributes({:cause_id => cause3.id, 
								:latitude =>  46.85,  
								:longitude =>  -84.35 })

	location7=Location.find_or_create_by_name("ACME Business")
	location7.update_attributes({:cause_id => cause3.id, 
								:latitude =>  46.45 , 
								:longitude =>  -84.95 })

	need1= DonationsNeed.find_or_create_by_name("We need money for a car")
	need1.update_attributes({:cause_id => cause3.id, 
							 :description=> 'We need a car'	 })

	need2= DonationsNeed.find_or_create_by_name("We need money for a boat")
	need2.update_attributes({:cause_id => cause1.id, 
							 :description=> 'We need a boat'	 })

	need3= GoodNeed.find_or_create_by_name("We need a desk")
	need3.update_attributes({:cause_id => cause2.id, 
							 :description=> 'We need a desk'	 })

	need4= GoodNeed.find_or_create_by_name("We need a car")
	need4.update_attributes({:cause_id => cause3.id, 
							 :description=> 'We need a car'	 })

	need5= VolunteerNeed.find_or_create_by_name("We need a programmer")
	need5.update_attributes({:cause_id => cause3.id, 
							 :address => '123 N. State st. Chicago, IL',
							 :start_date => '2013-05-13 21:01:20.900349',
							 :end_date => '2013-05-14 21:01:20.900349',
							 :description=> 'Programmer'	 })

	need6= VolunteerNeed.find_or_create_by_name("We need a driver")
	need6.update_attributes({:cause_id => cause2.id, 
		 					 :address => '123 N. State st. Chicago, IL',
		 					 :start_date => '2013-05-13 21:01:20.900349',
							 :end_date => '2013-05-14 21:01:20.900349',
							 :description=> 'Driver'	 })

	puts "Development data loaded"
end

desc "Setup test database - drops, loads schema, migrates and seeds the test db"
task :test_db_setup => [:environment] do
  Rails.env = ENV['RAILS_ENV'] = 'test'
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:schema:load'].invoke 
 
  Rake::Task['populateDevData'].invoke
  #File.open(File.join(ENV['CC_BUILD_ARTIFACTS'] || 'log', 'schema-load.log'), 'w') { |f| f.write(result) }
  Rake::Task['db:seed'].invoke
  ActiveRecord::Base.establish_connection
  Rake::Task['db:migrate'].invoke
  puts "Teat data loaded"
end
