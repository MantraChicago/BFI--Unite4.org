source 'https://rubygems.org'

gem 'simple-settings', '~>0.0.6'

gem 'hipchat'
gem 'rails', '3.2.13'

gem 'devise', '2.2.3'
gem 'cancan'

gem 'omniauth','1.1.4'
gem 'omniauth-facebook'

gem "paperclip", "~> 2.7"

gem 'stripe', :github  => 'stripe/stripe-ruby'

gem 'airbrake'
gem 'customerio','0.5.0'

gem 'activeadmin', '0.6.0'

gem 'capistrano'
gem 'capistrano-ext'
gem 'rvm-capistrano'
gem 'capistrano-recipes'
gem 'colored'
gem 'net-ssh-shell'

gem 'pg'
gem 'annotate'
gem 'json'

gem 'delayed_job_active_record'
gem "daemons", "= 1.0.10"
gem "delayed_job", "~> 3.0.5"

# location gems
gem 'carmen'
gem 'geokit'

gem "friendly_id", "~> 4.0.9"
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.6'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3', '>= 0.3.6'
  gem 'simple-settings', '~>0.0.6'
end

gem 'ejs'
gem 'slim', '1.2.2'
gem 'skim', '0.8.6'

gem 'smooth', :github => "datapimp/smooth" 
#gem 'smooth', :path => File.join(ENV['HOME'],'Projects','smooth')
gem 'jquery-rails'

gem 'compass', '0.12.2'
gem 'zurb-foundation', '4.2.3'
#gem 'font-awesome-rails', '3.2.1.2'

gem 'pry-rails'
gem 'pry-nav'

# segfault
#gem 'pry-stack_explorer'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "quiet_assets"
end

# Deploy with Capistrano
gem 'capistrano'

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
end
