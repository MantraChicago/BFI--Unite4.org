class GoodNeed < ActiveRecord::Base
  attr_accessible :picture, :name,:cause_id, :description, :address
  belongs_to :cause

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
