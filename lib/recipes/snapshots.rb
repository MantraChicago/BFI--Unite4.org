Capistrano::Configuration.instance.load do
  namespace :snapshots do
    desc "Prepare the environment"
    task :prepare do
      run "mkdir -p #{ shared_path }/backup"
    end

    desc "Syncs your local development environment with data / files from production"
    task :all do
      prepare
      system_folder.download
      system_folder.restore
      database.download
      database.restore
    end

    namespace :system_folder do
      desc "Downloads an archive of the system folder"
      task :download do
        run "cd #{ shared_path }/system && tar -c * |gzip -c > #{ shared_path }/backup/system.tar.gz"
        get "#{ shared_path }/backup/system.tar.gz", "snapshots/system.tar.gz"
      end

      desc "Restores your system folder from the snapshot"
      task :restore do
        project_root = Dir.pwd()
        system "cd #{ project_root }/public/system && rm -rf * && tar zxvf #{ project_root }/snapshots/system.tar.gz"
      end
    end

    namespace :database do
      desc "Downloads an archive of the database"
      task :download, :roles => :db, :only => {:primary=>true} do
        load_db_config
        prepare
        run "pg_dump -W -U #{db_user} -h #{db_host} #{db_name} > #{ db_remote_file }  " do |ch, stream, out |
          ch.send_data "#{db_pass}\n" if out=~ /^Password:/
        end
        get db_remote_file, db_local_file
      end

      desc "Restores your local db from the snapshot"
      task :restore do
        load_db_config
        download unless File.exists?(db_local_file)
        cfg = local_db_config
        system "bundle exec rake db:drop db:create"
        system "psql -U #{ cfg['username'] } -d #{ cfg['database'] } -f snapshots/bfi_production-dump.sql"
      end
    end
  end
    # Sets database variables from remote database.yaml
  def load_db_config
    puts "Rails Env #{ rails_env }"
    cfg = remote_db_config["production"]
    set(:db_file) { "#{db_name}-dump.sql" }
    set(:db_remote_file) { "#{shared_path}/backup/#{db_file}" }
    set(:db_local_file)  { "snapshots/#{db_file}" }

    set(:db_user) { cfg["username"] }
    set(:db_pass) { cfg["password"] }
    set(:db_host) { cfg["host"] }
    set(:db_name) { cfg["database"] }
  end

  def local_db_config
     YAML::load(ERB.new(IO.read(File.join('config', 'database.yml'))).result)['development']
  end

  def remote_db_config
    require 'yaml'
    file = capture "cat #{shared_path}/private/config/database.yml"
    @db_config ||= YAML.load(file)
  end

end
