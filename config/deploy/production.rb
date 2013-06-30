require 'rvm/capistrano'

server '198.199.88.212', :app, :web, :db, :primary => true
set :user, 'deploy'
set :deploy_to, '/home/deploy/rails_apps/bfi'
set :use_sudo, false


load 'deploy/assets'
