class CauseCauseneed < ActiveRecord::Base
  attr_accessible :causeneed_id, :cause_id
  belongs_to :causeneed
  belongs_to :cause
end
