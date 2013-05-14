class DonationsNeed < ActiveRecord::Base
  attr_accessible :name,:cause_id, :description
  belongs_to :cause
end
