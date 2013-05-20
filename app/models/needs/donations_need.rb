class DonationsNeed < Need
	
  #has_many :needs, :as => :needable
  has_many :donations
end
