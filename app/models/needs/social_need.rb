class SocialNeed < Need
  belongs_to :cause
  #has_many :needs, :as => :needable
end
