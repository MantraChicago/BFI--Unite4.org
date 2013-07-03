require 'rvm/capistrano'

# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))

server '192.34.61.72', :app, :web, :db, :primary => true
set :user, 'deploy'
set :deploy_to, '/home/deploy/rails_apps/bfi'
set :use_sudo, false
#set :shell, '/bin/zsh'
#set :default_shell, '/bin/zsh'

load 'deploy/assets'


