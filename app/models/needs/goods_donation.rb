class GoodsDonation < ActiveRecord::Base
  include Unite::Fulfillment

  attr_accessible :need_id, :user_id, :description
  belongs_to :cause, :counter_cache => true
  belongs_to :need
  belongs_to :user, :counter_cache => true

  after_create :after_create

  def after_create
    $customerio_user.track(need.cause.id, "new_good_donation")
  end
end

# == Schema Information
#
# Table name: goods_donations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  need_id     :integer
#  cause_id    :integer
#  description :string(255)
#  quantity    :integer
#  cash_value  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

