class SocialNeed < Need
  attr_accessible :name,:cause_id, :description
  belongs_to :cause
  #has_many :needs, :as => :needable
end
