class City
  def self.all
  	[{
  	  name: "Chicago",
      picture: "/assets/cities/chicago.jpeg",
      slug: "chicago",
      latitude: 41.896432,
      longitude: -87.643053,
    },
    {
  	  name: "San Francisco",
      picture: "/assets/cities/san_francisco.jpeg",
      slug: "san-francisco",
      latitude: 37.784827,
      longitude: -122.727802,
    },
    {
  	  name: "New York",
      slug: "new-york",
      picture: "/assets/cities/new_york_city.jpeg",
      longitude: -73.99834,
      latitude: 40.72596,
    },
	]
  end

  def self.grouped_by_cause_type cause_type_slug
    Cause.joins(:cause_type).where("cause_types.slug = ?", cause_type_slug).group(:city_slug).count
  end

  def self.find_by_slug slug
    all.detect do |city|
      city[:slug] == slug.downcase
    end
  end

  def self.[] key
    all.detect do |city|
      city[:name].downcase == key.downcase
    end
  end

  def self.coordinates_for city
    hash = City[city]
    [hash[:latitude], hash[:longitude]]
  end
end
