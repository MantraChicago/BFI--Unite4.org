class Causeneed < ActiveRecord::Base
  attr_accessible :name

  has_many :cause_causeneeds
  has_many :cause, :through => :cause_causeneeds
end
