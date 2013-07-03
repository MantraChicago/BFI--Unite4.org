class Follower < ActiveRecord::Base
  attr_accessible :cause_id, :need_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :cause, counter_cache: true

  belongs_to :need
end
