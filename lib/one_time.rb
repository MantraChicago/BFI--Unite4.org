# Write tasks that can be run just once.
module OneTime
  def self.method_missing meth, *args
    puts "This method does not exist anymore."
  end

  def self.fix_locations
    Unite::Development.create_missing_locations
  end

  def self.fix_missing_campaigns
    Cause.all.each(&:create_default_campaign)
  end

  def self.set_cause_type_id
    Cause.all.each do |cause|
      puts "Updating Cause Type For #{ cause.name }..."
      puts "Setting to... " + "#{ cause.cause_type_id = cause.cause_types.first.try(:id) }"

      cause.save
    end
  end
end
