require 'rvm/capistrano'

server '192.241.149.12', :app, :web, :db, :primary => true
set :user, 'deploy'
set :deploy_to, '/home/deploy/rails_apps/unite4.org'
set :use_sudo, false


load 'deploy/assets'
