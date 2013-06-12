class Location < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude, :cause_id
  belongs_to :cause
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

