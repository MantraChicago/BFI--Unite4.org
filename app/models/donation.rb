class Donation < ActiveRecord::Base
  attr_accessible :amount, :tip, :tracking
end
