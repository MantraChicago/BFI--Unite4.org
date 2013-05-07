class CauseType < ActiveRecord::Base
  attr_accessible :name
  has_many :causes
end
