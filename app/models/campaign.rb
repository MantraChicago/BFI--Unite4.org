class Campaign < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

	attr_accessible :type_of_need, :goal_summary, :timefame_description, :active,:cause_id, :need_id, :start_date, :end_date, :percent_complete, :desired_state, :current_state

	belongs_to :cause
	belongs_to :need

  scope :active, lambda { where(active:true) }
	scope :inactive, lambda { where(active:false) }

  before_save :set_defaults

  def self.related_for_need(need_object)
    return unless need_object

    found = active.joins(:need).where(need_id: need_object.id).first
    return found if found

    active.joins(:need).where("needs.type_of_need" => need_object.type_of_need).first
  end

  def progress_calculator

  end

  def percent_complete calculate=false
    value = read_attribute(:percent_complete)
    return value if value and !calculate

    return 0 if desired_state.nil? || desired_state.to_i == 0

    self.percent_complete = ((current_state.to_f / desired_state.to_f) * 100).to_i
  end

  def goal_summary
    read_attribute(:goal_summary) || default_goal_summary
  end

  def current_state calculate=false
    (read_attribute(:current_state) || 0).to_i
  end

  def desired_state
    (read_attribute(:desired_state) || default_desired_state).to_i
  end

  def timeframe_description
    read_attribute(:timeframe_description) || "2 Weeks"
  end

  def default_desired_state
    case type_of_need
    when "followers"
      200
    when "volunteers"
      10
    when "goods_donations"
      500
    when "cash_donations"
      5000
    end
  end

  def days_to_go
    (-1 * ((Time.zone.now - self.end_date) / 1.day).to_i) + 1
  end

  def goal_unit
    type_of_need.humanize.capitalize
  end

  def type_of_need
    read_attribute(:type_of_need) || (need && need.type_of_need)
  end

  def default_goal_summary
    case type_of_need
    when "followers"
      "#{ desired_state } Followers in #{ timeframe_description }"
    when "volunteers"
      "#{ desired_state } Volunteers in #{ timeframe_description }"
    when "goods_donations"
      "#{ desired_state } Cans of food in #{ timeframe_description }"
    when "cash_donations"
      "#{ desired_state } Dollars in #{ timeframe_description }"
    end
  end

  def set_defaults
    self.type_of_need ||= (need && need.type_of_need || "followers")
    self.start_date ||= Time.now
    self.end_date ||= 30.days.from_now
    self.current_state ||= 0
    self.percent_complete ||= 0
    self.desired_state ||= default_desired_state
    self.active ||= true
  end
end

# == Schema Information
#
# Table name: campaigns
#
#  id                   :integer          not null, primary key
#  cause_id             :integer
#  need_id              :integer
#  start_date           :datetime
#  end_date             :datetime
#  percent_complete     :integer
#  desired_state        :string(255)
#  current_state        :string(255)
#  active               :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  type_of_need         :string(255)
#  goal_summary         :string(255)
#  timefame_description :string(255)
#

