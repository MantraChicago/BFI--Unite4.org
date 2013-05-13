class VolunteerNeed < ActiveRecord::Base
  attr_accessible :name,:cause_id, :description
  belongs_to :cause
  has_many :volunteers
end
