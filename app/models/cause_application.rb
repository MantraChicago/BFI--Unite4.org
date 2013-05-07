class CauseApplication < ActiveRecord::Base
  attr_accessible :name, :org_name, :website, :email, :phone_number, :mission, :how_hear

  validates :name, :presence => true
  validates :org_name, :presence => true
  validates :website, :presence => true
  validates :email, :presence => true
  validates :phone_number, :presence => true
  validates :mission, :presence => true
end
