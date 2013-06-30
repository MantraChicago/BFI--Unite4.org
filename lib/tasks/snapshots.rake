namespace :snapshot do
  require 'net/ssh'
  require 'net/scp'
  require 'net/ssh/shell'

  USERNAME = "deploy"
  PROJECT_PATH = "/home/deploy/rails_apps/bfi"

  STAGING_HOST = "198.199.88.212"
  PRODUCTION_HOST = "198.199.88.212"
  SNAPSHOT_PATH = "/opt/snapshots/"

  def host(rails_env)
    return PRODUCTION_HOST if rails_env == :production
    return STAGING_HOST
  end

  def download(file, destination)
    print "\n"
    Net::SCP.start(PRODUCTION_HOST, USERNAME) do |scp|
      puts "Downloading #{file}...".green
      jump = "\r\e[0K"
      scp.download!("#{SNAPSHOT_PATH}/#{file}", destination) do |ch, name, sent, total|
        percent_complete = sprintf("%#.2f%", ((sent.to_f / total.to_f) * 100))
        print "#{jump}#{name}: #{sent}/#{total} (#{percent_complete})"
      end
    end
    print "\n"
  end
  
  def run_command(args, command)
    rails_env = args[:rails_environment] ? args[:rails_environment].to_sym : :production
    host = host(rails_env)
    Net::SSH.start(host, USERNAME) do |ssh|
      ssh.shell do |zsh|
        zsh.execute(command)
        zsh.execute("exit")
      end
    end
  end

  def remote_archive(args, command, file)
    rails_env = args[:rails_environment] ? args[:rails_environment].to_sym : :production
    host = host(rails_env)

    Net::SSH.start(host, USERNAME) do |ssh|
      ssh.shell do |zsh|
        response = zsh.execute(command)

        if host == PRODUCTION_HOST
          response = zsh.execute "mv /tmp/#{file} #{SNAPSHOT_PATH}"
        else
          response = zsh.execute "scp /tmp/#{file} #{USERNAME}@#{PRODUCTION_HOST}:#{SNAPSHOT_PATH}"
        end

        zsh.execute "exit"
      end
    end

  end
  
  desc "Run bundle install. Temporary fix for snapshot bug"
  task :bundle_fix do |t,args|
    run_command(args, "cd ~/rails_apps/bfi/current && bundle install")
  end

  desc "Refresh local development environment from snapshots stored on staging"
  task :fetch_latest => :environment do
    Rake::Task["snapshot:system_folder:fetch_latest"].invoke
    Rake::Task["snapshot:database:fetch_latest"].invoke
  end

  desc "Snapshot everything and store on staging"
  task :all, [:rails_environment] => [:environment] do |t, args|
    rails_env = args[:rails_environment] ? args[:rails_environment].to_sym : :production
    puts "Snapshotting #{rails_env}...".magenta
    Rake::Task["snapshot:system_folder:snapshot"].invoke(args[:rails_environment])
    Rake::Task["snapshot:database:snapshot"].invoke(args[:rails_environment])
  end

  desc "Refresh staging environment"
  task :refresh_staging => :environment do
    Net::SSH.start(STAGING_HOST, USERNAME) do |ssh|
      puts "Loading system folder...".green
      response = ssh.exec!("rm -rf #{PROJECT_PATH}/shared/public/system")
      response = ssh.exec!("mkdir -p #{PROJECT_PATH}/shared/public/system")
      response = ssh.exec!("scp #{USERNAME}@#{PRODUCTION_HOST}:/#{SNAPSHOT_PATH}/system.tar.gz #{PROJECT_PATH}/shared/public/system")
      response = ssh.exec!("cd #{PROJECT_PATH}/shared/public/system && tar -xzvf system.tar.gz")
      puts response.red if response.present?

      puts "Loading database...".green
      response = ssh.exec!("scp #{USERNAME}@#{PRODUCTION_HOST}:/#{SNAPSHOT_PATH}/latest-db-snapshot-postgres.sql.gz /tmp/latest-db-snapshot-postgres.sql.gz")
      response = ssh.exec!("gunzip -f /tmp/latest-db-snapshot-postgres.sql.gz")
      response = ssh.exec!("cd #{PROJECT_PATH}/current && RAILS_ENV=staging bundle exec rake db:load")
      puts response.red if response.present?

    end
  end

  namespace :system_folder do
    desc "Takes a snapshot of the system folder and puts it on the staging server"
    task :snapshot, [:rails_environment] => :environment do |t, args|
      puts "Archiving system folder...".green
      remote_archive(args, "cd #{PROJECT_PATH}/shared/system && tar -czf /tmp/system.tar.gz .", "system.tar.gz")
    end

    desc "Downloads latest system folder snapshot stored on staging"
    task :fetch_latest => :environment do
      file = "system.tar.gz"
      puts "Removing existing system folder...".green
      system "rm -rf #{Rails.root}/public/system"
      system "mkdir -p #{Rails.root}/public/system"

      download(file, "#{Rails.root}/public/system/#{file}")

      puts "Extracting system folder archive...".green
      system "cd #{Rails.root}/public/system && tar -xzf #{file}"
      system "cd #{Rails.root}/public/system && rm #{file}"
    end
  end

  namespace :database do
    desc "Takes a snapshot of the database and puts it on the staging server"
    task :snapshot, [:rails_environment] => [:environment] do |t, args|
      rails_env = args[:rails_environment] ? args[:rails_environment].to_sym : :production
      puts "Snapshotting #{rails_env} database...".green
      remote_archive(args, "cd #{PROJECT_PATH}/current && RAILS_ENV=#{rails_env} bundle exec rake snapshot:dump", "latest-db-snapshot-postgres.sql.gz")
    end

    desc "Downloads the latest database snapshot stored on staging"
    task :fetch_latest => :environment do
      file = "latest-db-snapshot-postgres.sql.gz"
      `mkdir -p #{Rails.root}/tmp/`
      download(file, "#{Rails.root}/tmp/#{file}")

      db = YAML::load(ERB.new(IO.read(File.join('config', 'database.yml'))).result)[Rails.env]
      puts "Extracting database archive...".green
      system "gunzip -f tmp/#{file}"
      puts "Dropping database #{ db['database']}...".green
      Rake::Task['db:drop'].invoke
      puts "Creating database #{db['database']}...".green
      Rake::Task['db:create'].invoke
      puts "Loading database archive...".green
      system "psql -U #{db['username']} -d #{db['database']} -f tmp/latest-db-snapshot-postgres.sql"
      system "rm #{Rails.root}/tmp/latest-db-snapshot-postgres.sql"
    end
  end

end

namespace :snapshot do
  desc "Dump the database"
  task :dump => :environment do |t, args|
    Unite::DatabaseUtil.dump
  end

  desc "Load up the database"
  task :load => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Unite::DatabaseUtil.load
  end
end

