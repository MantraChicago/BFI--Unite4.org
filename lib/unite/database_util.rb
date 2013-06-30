module Unite
  class DatabaseUtil
    DONT_TRUNCATE = [:schema_migrations, :platforms]
    FILENAME = "latest-db-snapshot-postgres.sql"

    # Truncates all tables in the database
    #
    # options:
    # @param {Array} :exclude tables to exclude from the truncation
    def self.truncate(options={})
      exclude = options[:exclude].collect(&:to_sym) if options[:exclude]
      exclude = ([exclude] + DONT_TRUNCATE).flatten.compact.uniq

      ActiveRecord::Base.connection.tables.each do |table_name|
        ActiveRecord::Base.connection.execute("TRUNCATE #{table_name}") if !exclude.include?(table_name.to_sym)
      end
    end

    def self.dump
      path = "/tmp/"
      host = database_config[:host].blank? ? "localhost" : database_config[:host]

      system "rm -f #{path}#{FILENAME}"
      system "export PGPASSWORD=#{database_config[:password]} && pg_dump -Oc #{database_config[:database]} --username=#{database_config[:username]} --host=#{host} | gzip > #{path}#{FILENAME}.gz && unset PGPASSWORD"
    end

    def self.load
      path = "/tmp/"
      host = database_config[:host].blank? ? "localhost" : database_config[:host]

      system "gunzip #{path}#{FILENAME}.gz"
      system "psql -U #{database_config[:username]} -d #{database_config[:database]} -f #{path}#{FILENAME}"
    end

    def self.reset_all_user_passwords
      raise "Can only run in development!" unless Rails.env.development?
      ActiveRecord::Base.connection.execute("UPDATE USERS SET ENCRYPTED_PASSWORD = '$2a$10$CirtrZEnK2kzGPyefXeh5O0MnrunV0o8j9azqFjaQUGpilGavVUFW', PASSWORD_SALT='$2a$10$EdsgCZSiYbYZSesCwKvPVu'")
    end

    def self.archive_table(table_name)
      path = "#{Rails.configuration.nfs_path}/dbbackups/"
      host = database_config[:host].blank? ? "localhost" : database_config[:host]

      filename = table_name + "-#{Time.now.strftime('%m%d%Y')}"
      system "export PGPASSWORD=#{database_config[:password]} && pg_dump -a -t #{table_name} #{database_config[:database]} --username=#{database_config[:username]} --host=#{host} | gzip > #{path}#{filename}.sql.gz && unset PGPASSWORD"
    end

private

    def self.database_config
      ActiveRecord::Base.connection_config
    end

  end
end
