class DonationsNeed < Need
  attr_accessible :name,:cause_id, :description
  #has_many :needs, :as => :needable
  has_many :donations
end
