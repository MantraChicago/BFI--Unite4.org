class Campaign < ActiveRecord::Base

  include Smooth::Queryable
  include Smooth::Presentable

	attr_accessible :active,:cause_id, :need_id, :start_date, :end_date, :percent_complete, :desired_state, :current_state

	belongs_to :cause
	belongs_to :need

	scope :active, lambda { where(active:true) }
	scope :inactive, lambda { where(active:false) }

  before_save :set_defaults

  def percent_complete
    20
  end

  def set_defaults
    self.start_date = Time.now
    self.end_date = 30.days.from_now
    self.percent_complete = 0
    self.active = true
  end
end
