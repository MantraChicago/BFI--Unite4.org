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

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"

namespace :db do
  desc 'rake db:migrate'
  task :migrate do
    run "cd #{current_release} && bundle exec rake db:migrate RAILS_ENV=#{rails_env}"
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
