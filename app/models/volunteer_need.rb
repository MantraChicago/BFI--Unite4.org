class VolunteerNeed < Need
  attr_accessible :address,:start_date, :end_date, :name,:cause_id, :description
  has_many :volunteers
  #has_many :needs, :as => :needable
end
