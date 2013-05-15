class CauseApplication < ActiveRecord::Base
  attr_accessible :name, :org_name, :website, :email, :phone_number, :mission, :how_hear

  validates :name, :org_name, :website, :phone_number, :mission,   :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
