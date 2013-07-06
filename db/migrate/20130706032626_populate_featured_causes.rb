class PopulateFeaturedCauses < ActiveRecord::Migration
  def up
    begin
      FeaturedCause.populate!
    rescue
      puts "Failed to populate featueed causes: #{ $! }"
    end
  end

  def down
  end
end
