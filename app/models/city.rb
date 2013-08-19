class City < ActiveRecord::Base
  attr_accessible :name, :slug, :picture, :state, :latitude, :longitude
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url =>  "/assets/missing.jpeg"
  has_and_belongs_to_many :causes


  def self.default_cities
   [{id: 0, name: 'New York', slug: 'new-york', latitude: '40.7142', longitude: '74.0064', state: 'New York'},
    {id: 1, name: 'Philadelphia', slug: 'philadelphia', latitude: '39.9500', longitude: '75.1642', state: 'Pennsylvania'},
    {id: 2, name: 'Washington', slug: 'washington', latitude: '38.8951', longitude: '77.0367', state: 'District of Columbia'},
    {id: 3, name: 'Pittsburgh', slug: 'pittsburgh', latitude: '40.4406', longitude: '80.0000', state: 'Pennsylvania'}, 
    {id: 4, name: 'Cleveland', slug: 'cleveland', latitude: '41.4994', longitude: '81.6956', state: 'Ohio'},
    {id: 5, name: 'Athens', slug: 'athens', longitude: '33.9500', latitude: '83.3833', state: 'Georgia'}, 
    {id: 6, name: 'Detroit', slug: 'detroit', latitude: '42.3314', longitude: '83.0458', state: 'Michigan'}, 
    {id: 7, name: 'Ann Arbor', slug: 'ann-arbor', latitude: '42.2708', longitude: '83.7483', state: 'Michigan'}, 
    {id: 8, name: 'Chicago', slug: 'chicago', latitude: '41.8819', longitude: '87.6500', state: 'Illinois'},
    {id: 9, name: 'St. Louis', slug: 'st-louis', latitude: '38.6272', longitude: '90.2000', state: 'Missouri'},
    {id: 10, name: 'Nashville', slug: 'nashville', latitude: '36.1658', longitude: '86.7833', state: 'Tennessee'},
    {id: 11, name: 'Atlanta', slug: 'atlanta', latitude: '33.7489', longitude: '84.3900', state: 'Georgia'},
    {id: 12, name: 'Athens', slug: 'athens', latitude: '39.3292', longitude: '82.0961', state: 'Ohio'}, 
    {id: 13, name: 'Orlando', slug: 'orlando', latitude: '28.5381', longitude: '81.3794', state: 'Florida'},
    {id: 14, name: 'Miami', slug: 'miami', latitude: '25.7216', longitude: '80.2793', state: 'Florida'},
    {id: 15, name: 'Tampa', slug: 'tampa', latitude: '27.9710', longitude: '82.4650', state: 'Florida'},
    {id: 16, name: 'New Orleans', slug: 'new-orleans', latitude: '29.9728', longitude: '90.0590', state: 'Louisiana'},
    {id: 17, name: 'Houston', slug: 'houston', latitude: '29.7631', longitude: '95.3631', state: 'Texas'},
    {id: 18, name: 'Austin', slug: 'austin', latitude: '30.2669', longitude: '97.7500', state: 'Texas'},
    {id: 19, name: 'Oklahoma City', slug: 'oklahoma-city', latitude: '35.4675', longitude: '97.5350', state: 'Oklahoma'},
    {id: 20, name: 'Santa Fe', slug: 'santa-fe', latitude: '35.6869', longitude: '105.9372', state: 'New Mexico'},
    {id: 21, name: 'Denver', slug: 'denver', latitude: '39.7392', longitude: '104.9842', state: 'Colorado'},
    {id: 22, name: 'Salt Lake City', slug: 'salt-lake-city', latitude: '40.7500', longitude: '111.8833', state: 'Utah'},
    {id: 23, name: 'Boise', slug: 'boise', latitude: '43.6137', longitude: '116.2025', state: 'Idaho'},
    {id: 24, name: 'Seattle', slug: 'seattle', latitude: '47.6097', longitude: '122.3331', state: 'Washington'},
    {id: 25, name: 'Portland', slug: 'portland', latitude: '45.5200', longitude: '122.6819', state: 'Oregon'},
    {id: 26, name: 'San Francisco', slug: 'san-francisco', latitude: '37.7750', longitude: '122.4167', state: 'California'},
    {id: 27, name: 'San Jose', slug: 'san-jose', latitude: '37.7750', longitude: '122.4167', state: 'California'},
    {id: 28, name: 'Sacramento', slug: 'sacramento', latitude: '37.7750', longitude: '122.4167', state: 'California'},
    {id: 29, name: 'Las Vegas', slug: 'las-vegas', latitude: '36.0800', longitude: '115.1522', state: 'Nevada'},
    {id: 30, name: 'Phoenix', slug: 'phoenix', latitude: '33.26', longitude: '112.04', state: 'Arizona'},
    {id: 31, name: 'San Diego', slug: 'san-diego', latitude: '32.7150', longitude: '117.1564', state: 'California'},
    {id: 32, name: 'Los Angeles', slug: 'los-angeles', latitude: '34.0522', longitude: '118.2428', state: 'California'}] 

  end

  def self.create_defaults
    self.default_cities.each do |city_hash|
      city = City.find_or_create_by_slug city_hash[:slug]
      city.update_attributes city_hash
      city.save
    end
  end

  def self.get_closest_city_flat_euclidean(lat,long)
    closest_city = nil 
    closest_distance = 999999999
    City.all.each do |city|
      distance = Math.sqrt( ((lat-city.latitude)**2) + ((long-city.longitude)**2) )
      if distance<closest_distance
        closest_city=city
        closest_distance=distance
      end
    end
    closest_city
  end

end
