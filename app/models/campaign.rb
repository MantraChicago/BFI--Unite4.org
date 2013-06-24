class Campaign < ActiveRecord::Base

	attr_accessible :active,:cause_id, :need_id, :start_date, :end_date, :percent_complete, :desired_state, :current_state

	belongs_to :cause
	belongs_to :need

	scope :active, lambda { where(active:true) }
	scope :inactive, lambda { where(active:false) }

end

# == Schema Information
#
# Table name: campaigns
#
#  id               :integer          not null, primary key
#  cause_id         :integer
#  need_id          :integer
#  start_date       :datetime
#  end_date         :datetime
#  percent_complete :integer
#  desired_state    :string(255)
#  current_state    :string(255)
#  active           :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

