class CauseApplication < ActiveRecord::Base
  attr_accessible :name, :org_name, :website, :email, :phone_number, :mission, :how_hear

  validates :name, :org_name, :website, :email, :phone_number, :mission,   :presence => true
 
end
