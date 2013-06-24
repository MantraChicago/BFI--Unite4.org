class Campaign < ActiveRecord::Base

	attr_accessible :active,:cause_id, :need_id, :start_date, :end_date, :percent_complete, :desired_state, :current_state

	belongs_to :cause
	belongs_to :need

	scope :active, lambda { where(active:true) }
	scope :inactive, lambda { where(active:false) }

end
