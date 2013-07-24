class Follower < ActiveRecord::Base
  include Unite::Fulfillment
  attr_accessible :cause_id, :need_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :cause, counter_cache: true

  belongs_to :need

  validates_uniqueness_of :cause_id, :scope => [:user_id]

  validates_presence_of :user_id, :cause_id

  delegate :avatar, :to => :user

  after_create :after_create

  def after_create
    $customerio_user.track(need.cause.id, "new_follower", attributes)
  end
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

