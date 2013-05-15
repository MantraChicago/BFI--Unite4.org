class VolunteerNeed < ActiveRecord::Base
  attr_accessible :address,:start_date, :end_date, :name,:cause_id, :description
  belongs_to :cause
  has_many :volunteers
end
