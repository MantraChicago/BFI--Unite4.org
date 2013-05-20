class VolunteerNeed < Need
  has_many :volunteers
  #has_many :needs, :as => :needable
end
