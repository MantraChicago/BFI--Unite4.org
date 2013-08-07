class CashDonation < ActiveRecord::Base
  include Unite::Fulfillment

  attr_accessible :need_id, :user_id, :amount, :tip_amount, :stripe_id

  belongs_to :cause, :counter_cache => true
  belongs_to :need
  belongs_to :user, :counter_cache => true

  # You're right this doesn't belong in the model.  The CashDonation model itself
  # isn't concerned with where the money comes from, it is just meant to record the
  # giving of money to a cause.
  #
  # The NeedsFullfillmentProxy is where we should encapsulate the request from the
  # end user. Forget callback chains, they are trouble.
  #
  after_create :charge_credit_card, :track_donation  # I really really don't think this should be in a model, but where else?

  after_create :record_event

  updates_campaign_with :total_amount

  def message
    "Cash Donation to #{ cause.name }"
  end

  def total_amount
    (amount+tip_amount) *100
  end

  def amount
    read_attribute(:amount) || 0
  end

  def tip_amount
    read_attribute(:tip_amount) || 0
  end

  def track_donation
    $customerio_user.track(need.cause.id, "new_cash_donation")
  end

  def contribution_increment
    amount * 100
  end

  def charge_credit_card
    if valid?
      Unite::PaymentGatewayService.charge stripe_id, total_amount, message
    end
  end

  def record_event
    Unite::Events::Tracker.track_event('donated_to_cause',user_id, :cause_id => cause_id)
  end
end

# == Schema Information
#
# Table name: cash_donations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  need_id    :integer
#  cause_id   :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stripe_id  :string(255)
#  tip_amount :integer
#

