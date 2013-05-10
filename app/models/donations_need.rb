class DonationsNeed < ActiveRecord::Base
  attr_accessible :name,:cause_id, :discription
  belongs_to :cause
end
