class Location < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :latitude, :longitude, :cause_id
  belongs_to :cause

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

