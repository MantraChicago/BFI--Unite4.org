class Contribution < ActiveRecord::Base
  include Smooth::Resource

  attr_accessible :need_id,
                  :need_type,
                  :fulfillment_type,
                  :fulfillment_id,
                  :user_id,
                  :cause_id

  belongs_to :user
  belongs_to :cause
  belongs_to :need, :polymorphic => true
  belongs_to :fulfillment, :polymorphic => true

  validates_presence_of :user_id, :cause_id, :need_id

  def self.for_user user
    where(user_id: user.id)
  end

  def self.query params={}
    results = scoped
    results = where(user_id: params[:user_id])

    results
  end
end

# == Schema Information
#
# Table name: contributions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  cause_id         :integer
#  fulfilment_id    :integer
#  fulfilment_type  :string(255)
#  need_id          :integer
#  need_type        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fulfillment_type :string(255)
#  fulfillment_id   :integer
#

