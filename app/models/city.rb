class City < ActiveRecord::Base
  attr_accessible :picture, :name
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing_city.jpg"
end
