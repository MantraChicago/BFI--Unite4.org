class Donation < ActiveRecord::Base
  	attr_accessible :amount, :tip, :tracking, :user_id, :donations_need_id

	belongs_to :user
	def amount_added_to_campaign_goal
	  	amount
	end
end

# == Schema Information
#
# Table name: donations
#
#  id                :integer          not null, primary key
#  amount            :float
#  tip               :float
#  tracking          :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  donations_need_id :integer
#

