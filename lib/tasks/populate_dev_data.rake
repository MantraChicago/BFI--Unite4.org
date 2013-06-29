namespace :db do
	desc "Create a new Active Admin user"
	task :create_active_admin_user, [:email, :password] => [:environment] do |t,args|
		email =args.email
		password=args.password
		AdminUser.create :email => email, :password => password, :password_confirmation => password
		puts "Active Admin user created for #{email}"
	end

	desc "Populate development data"
	task :populate_dev_data => [:environment, 'db:seed'] do
    Unite::Development.clear_database
    causes = Unite::Development.create_sample_causes_and_locations_in(:chicago) 
    Unite::Development.create_default_needs_for(causes)
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
end
