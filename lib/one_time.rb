# Write tasks that can be run just once.
module OneTime
  def self.method_missing meth, *args
    puts "This method does not exist anymore."
  end

  def self.fix_locations
    Unite::Development.create_missing_locations
  end
end
