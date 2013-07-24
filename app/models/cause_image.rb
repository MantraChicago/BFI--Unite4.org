class CauseImage < ActiveRecord::Base
  attr_accessible :cause_id, :picture, :caption

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"
  belongs_to :cause
end
