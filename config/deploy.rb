require 'capistrano/ext/multistage'
require 'rvm/capistrano'
require 'hipchat/capistrano'
require 'bundler/capistrano'
require 'delayed/recipes'

Dir.glob("#{ File.join(File.dirname(__FILE__),'..','lib','recipes') }/*.rb").each {|f| require(f) }

set :hipchat_token, "0e2c10e049c422f2345f2736ca7166"
set :hipchat_room_name, "bfi"
set :hipchat_announce, true

set :stages, ['production', 'staging']
set :default_stage, 'staging'
set :branch, fetch(:branch, "release_candidate")

set :application, 'bfi'
set :repository, 'git@github.com:MantraChicago/BFI--Unite4.org.git'

set :assets_role, :app

before "deploy:restart", "db:migrate"

before 'deploy:assets:precompile', 'sym_link:database'
before 'deploy:assets:precompile', 'sym_link:logs'
before 'deploy:assets:precompile', 'sym_link:settings'

# after "deploy:stop",    "delayed_job:stop"
# after "deploy:start",   "delayed_job:start"
# after "deploy:restart", "delayed_job:restart"

after "sym_link:database", "delayed_job:stop"
after "delayed_job:stop", "delayed_job:start"

namespace :db do
  desc 'rake db:migrate'
  task :migrate do
    run "cd #{current_release} && bundle exec rake db:migrate RAILS_ENV=#{stage}"
  end
end

namespace :delayed_job do
  task :stop do
    begin
      run "cd #{current_release} && RAILS_ENV=#{stage} bundle exec ./script/delayed_job stop"
    rescue
      puts "Failed to stop delayed_job (is it running?)"
    end
  end

  task :start do 
    puts "Starting delayed jobs"
    run "cd #{current_release} && RAILS_ENV=#{stage} bundle exec ./script/delayed_job start"
  end
end 

namespace :sym_link do
  desc 'sym link database.yml'
  task :database do
    run "cd #{current_release}/config && ln -s #{deploy_to}/shared/private/config/database.yml database.yml"
  end

  desc 'sym link production logs'
  task :logs do
    run "cd #{current_release} && rm -rf log && ln -s #{deploy_to}/shared/logs log"
  end

  desc 'sym link settings file'
  task :settings do
    run "cd #{current_release}/config && ln -s #{deploy_to}/shared/private/config/settings.yml settings.yml"
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
