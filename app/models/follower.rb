class Follower < ActiveRecord::Base
  attr_accessible :cause_id, :need_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :cause, counter_cache: true

  belongs_to :need
end

# == Schema Information
#
# Table name: followers
#
#  id         :integer          not null, primary key
#  cause_id   :integer
#  user_id    :integer
#  need_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

