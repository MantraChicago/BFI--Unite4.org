class Campaign < ActiveRecord::Base
	attr_accessible :cause_id, :need_id, :start_date, :end_date, :percent_complete, :desired_state, :current_state
  	belongs_to :cause
  	belongs_to :need
end
