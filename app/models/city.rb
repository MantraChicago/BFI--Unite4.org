class City < ActiveRecord::Base
  attr_accessible :name, :slug, :picture
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url =>  "/assets/missing.jpeg"
  has_and_belongs_to_many :causes


  def self.default_cities
    [{id: 0, name: 'New York', slug: 'new-york'},
    {id: 1, name: 'Philadelphia', slug: 'philadelphia'},
    {id: 2, name: 'Washington', slug: 'washington'},
    {id: 3, name: 'Pittsburgh', slug: 'pittsburgh'},
    {id: 4, name: 'Cleveland', slug: 'cleveland'},
    {id: 5, name: 'Athens', slug: 'athens'},
    {id: 6, name: 'Detroit', slug: 'detroit'},
    {id: 7, name: 'Ann Arbor', slug: 'ann-arbor'},
    {id: 8, name: 'Chicago', slug: 'chicago'},
    {id: 9, name: 'St. Louis', slug: 'st-louis'},
    {id: 10, name: 'Nashville', slug: 'nashville'},
    {id: 11, name: 'Atlanta', slug: 'atlanta'},
    {id: 12, name: 'Athens', slug: 'athens'},
    {id: 13, name: 'Orlando', slug: 'orlando'},
    {id: 14, name: 'Miami', slug: 'miami'},
    {id: 15, name: 'Tampa', slug: 'tampa'},
    {id: 16, name: 'New Orleans', slug: 'new-orleans'},
    {id: 17, name: 'Houston', slug: 'houston'},
    {id: 18, name: 'Austin', slug: 'austin'},
    {id: 19, name: 'Oklahoma City', slug: 'oklahoma-city'},
    {id: 20, name: 'Santa Fe', slug: 'santa-fe'},
    {id: 21, name: 'Denver', slug: 'denver'},
    {id: 22, name: 'Salt Lake City', slug: 'salt-lake-city'},
    {id: 23, name: 'Boise', slug: 'boise'},
    {id: 24, name: 'Seattle', slug: 'seattle'},
    {id: 25, name: 'Portland', slug: 'portland'},
    {id: 26, name: 'San Francisco', slug: 'san-francisco'},
    {id: 27, name: 'San Jose', slug: 'san-jose'},
    {id: 28, name: 'Sacramento', slug: 'sacramento'},
    {id: 29, name: 'Las Vegas', slug: 'las-vegas'},
    {id: 30, name: 'Phoenix', slug: 'phoenix'},
    {id: 31, name: 'San Diego', slug: 'san-diego'},
    {id: 32, name: 'Los Angeles', slug: 'los-angeles'}]
  end

  def self.create_defaults
    self.delete_all
    self.default_cities.each do |city_hash|
      city = City.find_or_create_by_id city_hash[:id]
      city.slug=city_hash[:slug]
      city.name=city_hash[:name]
      city.id=city_hash[:id]
      city.save
    end
  end
end
