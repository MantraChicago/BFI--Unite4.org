source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'devise', '2.2.3'

gem 'omniauth','1.1.4'
gem 'omniauth-facebook'

gem "paperclip", "~> 2.7"

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

#ember gems
gem 'ember-rails'
gem 'ember-source', '1.0.0.rc6'
gem 'handlebars-source', '1.0.0.rc4'

# location gems
gem 'carmen'
gem 'geokit'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'ejs'
gem 'slim', '1.2.2'
gem 'skim', '0.8.6'
gem 'smooth', :git => "git@github.com:datapimp/smooth.git" 
#gem 'smooth', :path => File.join(ENV['HOME'],'Projects','smooth')
gem 'jquery-rails'

gem 'compass'
gem 'zurb-foundation'
gem 'font-awesome-rails'

gem 'pry-rails'
gem 'pry-nav'

# segfault
#gem 'pry-stack_explorer'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'rspec-rails'
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
