class Need < ActiveRecord::Base

  attr_accessible :name, :settings, :cause_id, :description, :picture, :address, :start_date, :end_date, :type_of_need, :location_id
  attr_accessible :message, :goal_summary, :timefame_description, :desired_state, :current_state, :is_primary, :is_active, :settings

  belongs_to :cause
  belongs_to :location
  has_many :contributions

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/missing.jpeg"
  before_create :default_values
  serialize :settings, JSON
  include Smooth::Presentable

  def days_to_go
    days=(-1 * ((Time.zone.now - end_date) / 1.day).to_i) + 1
    (days <=0 )? 0: days
  end

  def self.need_types
    [GoodsDonationNeed, CashDonationNeed, VolunteerNeed, PromotionNeed]
  end


  def default_values
    self.is_active ||= true
    self.is_primary ||= false
    true
  end

  def percent_complete
    if current_state && current_state >0
      (current_state/desired_state).to_i
    else
      0
    end
  end

  def recalculate_progress!
    
  end

  def property key
    properties[key]
  end

  def need
    self
  end

  def social?
    type_of_need == "followers"
  end

  def goods?
    type_of_need == "goods_donations"
  end

  def cash?
    type_of_need == "cash_donations"
  end

  def volunteers?
    type_of_need == "volunteers"
  end

  scope :active, lambda { where( :is_active => true ) }

  

end




# == Schema Information
#
# Table name: needs
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  type_of_need         :string(255)
#  cause_id             :integer
#  description          :text
#  start_date           :datetime
#  end_date             :datetime
#  address              :string(255)
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  campaign_id          :integer
#  settings             :text
#  location_id          :integer
#

