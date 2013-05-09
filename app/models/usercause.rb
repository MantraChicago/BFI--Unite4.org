class Usercause < ActiveRecord::Base
  attr_accessible :user_id, :cause_id
  belongs_to :user
  belongs_to :cause
end
