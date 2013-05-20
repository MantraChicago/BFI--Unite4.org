class GoodNeed < Need
  attr_accessible :picture, :name,:cause_id, :description, :address
 
  has_many :needs, :as => :needable

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"
end
