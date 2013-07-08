require 'capistrano/ext/multistage'
require 'rvm/capistrano'
require 'delayed/recipes'

set :stages, ['production', 'staging']
set :default_stage, 'staging'
set :branch, fetch(:branch, "release_candidate")

set :application, 'bfi'
set :repository, 'git@github.com:MantraChicago/BFI--Unite4.org.git'


before "deploy:restart", "db:migrate"

before 'deploy:assets:precompile', 'sym_link:database'
before 'deploy:assets:precompile', 'sym_link:logs'
before 'deploy:assets:precompile', 'sym_link:settings'

after "deploy:update_code", "bundle:install"
after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"

namespace :bundle do
  desc 'bundle install'
  task :install do
    run "cd #{current_release} && bundle install"
  end
end

namespace :db do
  desc 'rake db:migrate'
  task :migrate do
    run "cd #{current_release} && bundle exec rake db:migrate RAILS_ENV=#{stage}"
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

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

set :max_asset_age, 60 ## Set asset age in minutes to test modified date against.

after "deploy:finalize_update", "deploy:assets:determine_modified_assets", "deploy:assets:conditionally_precompile"

namespace :deploy do
  namespace :assets do

    desc "Figure out modified assets."
    task :determine_modified_assets, :roles => assets_role, :except => { :no_release => true } do
      set :updated_assets, capture("find #{latest_release}/app/assets -type d -name .git -prune -o -mmin -#{max_asset_age} -type f -print", :except => { :no_release => true }).split
    end

    desc "Remove callback for asset precompiling unless assets were updated in most recent git commit."
    task :conditionally_precompile, :roles => assets_role, :except => { :no_release => true } do
      if(updated_assets.empty?)
        callback = callbacks[:after].find{|c| c.source == "deploy:assets:precompile" }
        callbacks[:after].delete(callback)
        logger.info("Skipping asset precompiling, no updated assets.")
      else
        logger.info("#{updated_assets.length} updated assets. Will precompile.")
      end
    end

  end
end
