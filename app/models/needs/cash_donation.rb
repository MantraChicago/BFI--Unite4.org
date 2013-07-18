class CashDonation < ActiveRecord::Base
  attr_accessible :need_id, :user_id, :amount, :tip_amount, :stripe_id

  belongs_to :cause, :counter_cache => true
  belongs_to :need
  belongs_to :user, :counter_cache => true
  after_create :charge_credit_card  # I really really don't think this should be in a model, but where else? 

  def related_campaign
    @related_campaign ||= cause.campaigns.where(:need_id => self.need_id).first
  end

  def update_campaign
    return unless related_campaign.present?

    current_amount = related_campaign.current_state.to_i

    current_amount += self.amount

    related_campaign.current_state = "#{ current_amount }"
  end

  def total_amount
    amount+tip_amount
  end

  def amount
    read_attribute(:amount) || 0
  end

  def tip_amount
    read_attribute(:tip_amount) || 0
  end

  def charge_credit_card
    if valid?
      message = "Charge for #{need.cause.name}"
      puts 'xxxxxx'+stripe_id.inspect
      Unite::PaymentGatewayService.charge stripe_id, total_amount, message
    end
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
#
