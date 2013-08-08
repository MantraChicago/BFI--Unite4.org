class UserBadge < ActiveRecord::Base
  attr_accessible :user_id, :cause_id, :badge_id, :need_id
  belongs_to :user
  belongs_to :cause
  belongs_to :badge
  belongs_to :need
end