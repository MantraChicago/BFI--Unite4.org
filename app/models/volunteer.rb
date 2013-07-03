class Volunteer < ActiveRecord::Base
  attr_accessible :need_id, :location_id, :cause_id, :user_id

  belongs_to :need
  belongs_to :location
  belongs_to :cause, :counter_cache => true
  belongs_to :user, :counter_cache => true
end
