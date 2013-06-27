class Location < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :latitude, :longitude, :cause_id, :lng, :lat, :address_line_one, :address_line_two, :city, :state, :postal_code, :country
  belongs_to :cause
  before_save :lookup_geo_coordinates, :if => :requires_geo_lookup?

  def lookup_geo_coordinates
    # TODO
    # Implement call to geokit
  end

  def requires_geo_lookup?
  #  #country_changed? || address_line_one_changed? || city_changed? || state_changed? || postal_code_changed? || !has_coordinates?
  #  address_line_one_changed? || city_changed? || state_changed? || postal_code_changed? || !has_coordinates?
  end

  def has_coordinates?
    lat.present? && lng.present?
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

    if origin.is_a?(String)
      lat, lng = "#{ origin }.strip.split(', ') }".compact.map(&:strip)
    end

    perform_distance_query(lat,lng,options[:within])
  end

  def self.perform_distance_query origin_lat, origin_lng, within
    origin_lat, origin_lng = deg2rad(origin_lat), deg2rad(origin_lng)

    {
      :conditions => %(
        (acos(cos(#{origin_lat})*cos(#{origin_lng})*cos(radians(users.lat))*cos(radians(users.lng))+
        cos(#{origin_lat})*sin(#{origin_lng})*cos(radians(users.lat))*sin(radians(users.lng))+
        sin(#{origin_lat})*sin(radians(users.lat)))*3963) <= #{within}
      ),
      :select => %( users.*,
        (acos(cos(#{origin_lat})*cos(#{origin_lng})*cos(radians(users.lat))*cos(radians(users.lng))+
        cos(#{origin_lat})*sin(#{origin_lng})*cos(radians(users.lat))*sin(radians(users.lng))+
        sin(#{origin_lat})*sin(radians(users.lat)))*3963) as distance
      )
    }

  end

end

# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cause_id   :integer
#  latitude   :float
#  longitude  :float
#  name       :string(255)
#

