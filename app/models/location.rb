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

