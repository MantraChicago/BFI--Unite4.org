require 'rvm/capistrano'

# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))

server 'staging.unite4.org', :app, :web, :db, :primary => true
set :user, 'deploy'
set :deploy_to, '/home/deploy/rails_apps/unite4.org'
set :use_sudo, false
set :rails_env, :staging

#set :shell, '/bin/zsh'
#set :default_shell, '/bin/zsh'

load 'deploy/assets'


