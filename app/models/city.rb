class City < ActiveRecord::Base
  attr_accessible :name, :slug, :picture, :state, :latitude, :longitude, :is_active
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url =>  "/assets/missing.jpeg"
  has_and_belongs_to_many :causes


  def self.default_cities
   [{is_active: true, name: 'New York', slug: 'new-york', latitude: '40.7142', longitude: '-74.0064', state: 'New York'},
    {is_active: true, name: 'Philadelphia', slug: 'philadelphia', latitude: '39.9500', longitude: '-75.1642', state: 'Pennsylvania'},
    {is_active: true, name: 'Washington', slug: 'washington', latitude: '38.8951', longitude: '-77.0367', state: 'District of Columbia'},
    {is_active: true, name: 'Pittsburgh', slug: 'pittsburgh', latitude: '40.4406', longitude: '-80.0000', state: 'Pennsylvania'}, 
    {is_active: true, name: 'Cleveland', slug: 'cleveland', latitude: '41.4994', longitude: '-81.6956', state: 'Ohio'},
    {is_active: true, name: 'Athens', slug: 'athens', latitude: '33.9500', longitude: '-83.3833', state: 'Georgia'}, 
    {is_active: true, name: 'Detroit', slug: 'detroit', latitude: '42.3314', longitude: '-83.0458', state: 'Michigan'}, 
    {is_active: true, name: 'Ann Arbor', slug: 'ann-arbor', latitude: '42.2708', longitude: '-83.7483', state: 'Michigan'}, 
    {is_active: true, name: 'Chicago', slug: 'chicago', latitude: '41.8819', longitude: '-87.6500', state: 'Illinois'},
    {is_active: true, name: 'St. Louis', slug: 'st-louis', latitude: '38.6272', longitude: '-90.2000', state: 'Missouri'},
    {is_active: true, name: 'Nashville', slug: 'nashville', latitude: '36.1658', longitude: '-86.7833', state: 'Tennessee'},
    {is_active: true, name: 'Atlanta', slug: 'atlanta', latitude: '33.7489', longitude: '-84.3900', state: 'Georgia'},
    {is_active: true, name: 'Athens', slug: 'athens', latitude: '39.3292', longitude: '-82.0961', state: 'Ohio'}, 
    {is_active: true, name: 'Orlando', slug: 'orlando', latitude: '28.5381', longitude: '-81.3794', state: 'Florida'},
    {is_active: true, name: 'Miami', slug: 'miami', latitude: '25.7216', longitude: '-80.2793', state: 'Florida'},
    {is_active: true, name: 'Tampa', slug: 'tampa', latitude: '27.9710', longitude: '-82.4650', state: 'Florida'},
    {is_active: true, name: 'New Orleans', slug: 'new-orleans', latitude: '29.9728', longitude: '-90.0590', state: 'Louisiana'},
    {is_active: true, name: 'Houston', slug: 'houston', latitude: '29.7631', longitude: '-95.3631', state: 'Texas'},
    {is_active: true, name: 'Austin', slug: 'austin', latitude: '30.2669', longitude: '-97.7500', state: 'Texas'},
    {is_active: true, name: 'Oklahoma City', slug: 'oklahoma-city', latitude: '35.4675', longitude: '-97.5350', state: 'Oklahoma'},
    {is_active: true, name: 'Santa Fe', slug: 'santa-fe', latitude: '35.6869', longitude: '-105.9372', state: 'New Mexico'},
    {is_active: true, name: 'Denver', slug: 'denver', latitude: '39.7392', longitude: '-104.9842', state: 'Colorado'},
    {is_active: true, name: 'Salt Lake City', slug: 'salt-lake-city', latitude: '40.7500', longitude: '-111.8833', state: 'Utah'},
    {is_active: true, name: 'Boise', slug: 'boise', latitude: '43.6137', longitude: '-116.2025', state: 'Idaho'},
    {is_active: true, name: 'Seattle', slug: 'seattle', latitude: '47.6097', longitude: '-122.3331', state: 'Washington'},
    {is_active: true, name: 'Portland', slug: 'portland', latitude: '45.5200', longitude: '-122.6819', state: 'Oregon'},
    {is_active: true, name: 'San Francisco', slug: 'san-francisco', latitude: '37.7750', longitude: '-122.4167', state: 'California'},
    {is_active: true, name: 'San Jose', slug: 'san-jose', latitude: '37.7750', longitude: '-122.4167', state: 'California'},
    {is_active: true, name: 'Sacramento', slug: 'sacramento', latitude: '37.7750', longitude: '-122.4167', state: 'California'},
    {is_active: true, name: 'Las Vegas', slug: 'las-vegas', latitude: '36.0800', longitude: '-115.1522', state: 'Nevada'},
    {is_active: true, name: 'Phoenix', slug: 'phoenix', latitude: '33.26', longitude: '-112.04', state: 'Arizona'},
    {is_active: true, name: 'San Diego', slug: 'san-diego', latitude: '32.7150', longitude: '-117.1564', state: 'California'},
    {is_active: true, name: 'Los Angeles', slug: 'los-angeles', latitude: '34.0522', longitude: '-118.2428', state: 'California'}] 

  end

  def self.create_defaults
    self.default_cities.each do |city_hash|
      city = City.find_or_create_by_slug city_hash[:slug]
      city.update_attributes city_hash
      city.save
    end
  end

  def self.get_closest_citys_flat_euclidean(lat,long)
    cities_distances={}
    City.active.all.each do |city|
      distance = Math.sqrt( ((lat-city.latitude)**2) + ((long-city.longitude)**2) )
      cities_distances[distance]=city
    end
    ret_array=[]
    cities_distances.each_ordered_by_key do |key, value|
       ret_array << value
    end
    ret_array
  end

  scope :active, lambda {where(:is_active => true)}

end

#problem is that order is not guaranteed
class Hash
   def each_ordered_by_key
      keys.sort.each do |key|
        yield(key, self[key])
      end
   end
end