class Location < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :latitude, :longitude, :cause_id, :lng, :lat, :address_line_one, :address_line_two, :city, :state, :postal_code, :country, :address, :region

  attr_accessor :skip_geocoding

  belongs_to :cause, :counter_cache => true

  before_save :lookup_geo_coordinates, :if => :should_geocode?

  validates_presence_of :city, :state, :address_line_one

  def address
    [address_line_one, address_line_two, "#{ city },#{ region }", postal_code].compact.join(" ")
  end

  def lookup_geo_coordinates
    apply_geokit_response(Unite::Util.lookup_address_details(address) || {})

    unless self.lat && self.lng
      fallback_geolookup(:postal_code) if self.postal_code
    end

    unless self.lat && self.lng
      fallback_geolookup(:city) if self.city && self.region
    end
  end

  def apply_geokit_response address_details={}
    self.lat            = address_details[:lat]
    self.lng            = address_details[:lng]
    self.region       ||= address_details[:region]
    self.city         ||= address_details[:region]
    self.country      ||= address_details[:country]
    self.postal_code  ||= address_details[:postal_code]

    self
  end

  def fallback_geolookup strategy=:postal_code
    if strategy == :postal_code
      address_details = Unite::Util.lookup_address_details(self.postal_code)
    end

    if strategy == :city
      address_details = Unite::Util.lookup_address_details("#{ self.city }, #{ self.region }")
    end

    if address_details.present?
      apply_geokit_response(address_details || {})
    end
  end

  def should_geocode?
   !skip_geocoding && (!has_coordinates? || address_changed?)
  end

  def address_changed?
    postal_code_changed? || address_line_one_changed? || city_changed? || region_changed? || country_changed?
  end

  def has_coordinates?
    lat.present? && lng.present?
  end

  def state
    self.region
  end

  def state= value
    self.region= value
  end

  def zip
    postal_code
  end

  def zip= value
    self.postal_code = value
  end

  def lat
    latitude
  end

  def lng
    longitude
  end

  def lat=value
    self.latitude = value
  end

  def lng=value
    self.longitude = value
  end

  def self.query params={}
    results = scoped

    results = results.where(:cause_id => params[:cause_id]) if params[:cause_id]

    results
  end

  def self.near origin, options={}
    where(:city => origin)
  end

  def self.lookup_coordinates_of(origin)
    # TODO build in support for dealing with multiple possible
    # objects representing an origin. accept an active record model,
    # an array, a hash, a string, etc
    if origin.is_a?(ActiveRecord::Base)
      lat, lng = origin.attributes.values_at(:lat,:lng)
    end

    if origin.is_a?(Array)
      lat, lng = origin
    end

    if origin.is_a?(Hash)
      lat, lng = origin.symbolize_keys.values_at(:lat, :lng)
    end

    if origin.is_a?(String) and origin.match(/\d+\,\d+/)
      lat, lng = origin.strip.split(',').compact.map(&:strip)
    elsif origin.is_a?(String)
      lat, lng = Unite::Util.perform_cached_geolocation_of(origin.strip)

      if !lat.is_a?(Float) && City[origin]
        lat, lng = City.coordinates_for(origin)
      else
        lat, lng = [0.0,0.0]
      end
    end

    [lat, lng]
  end

  # We need to hook up the postgis postgres extension to be able to do
  # this. because fuck this noise.
  def self.__near origin, options={}
    lat, lng = lookup_coordinates_of(origin)
    perform_distance_query(lat.to_f,lng.to_f,options[:within])
  end

  def self.deg2rad(degrees)
    degrees * (Math::PI / 180)
  end

  # http://www.inf.ufrgs.br/~vbogorny/CMP539/exercicio1/spatialQueries.html
  def self.perform_distance_query origin_lat, origin_lng, within=50
    origin_lat, origin_lng = deg2rad(origin_lat), deg2rad(origin_lng)

    results = scoped.where %(
      (acos(cos(#{origin_lat})*cos(#{origin_lng})*cos(radians(locations.latitude))*cos(radians(locations.longitude))+
      cos(#{origin_lat})*sin(#{origin_lng})*cos(radians(locations.latitude))*sin(radians(locations.longitude))+
      sin(#{origin_lat})*sin(radians(locations.latitude)))*3963) <= #{within}
    )

    results = results.select %( locations.*,
        (acos(cos(#{origin_lat})*cos(#{origin_lng})*cos(radians(locations.latitude))*cos(radians(locations.longitude))+
        cos(#{origin_lat})*sin(#{origin_lng})*cos(radians(locations.latitude))*sin(radians(locations.longitude))+
        sin(#{origin_lat})*sin(radians(locations.latitude)))*3964) as distance
    )

  end

end
