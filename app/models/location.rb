class Location < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude, :cause_id
  belongs_to :cause
end
