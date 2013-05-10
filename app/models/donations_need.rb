class DonationsNeed < ActiveRecord::Base
  attr_accessible :cause_id, :discription
  belongs_to :cause
end
