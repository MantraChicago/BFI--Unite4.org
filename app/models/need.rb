class Need < ActiveRecord::Base
  attr_accessible :name, :settings, :cause_id, :description, :picture, :address, :start_date, :end_date, :type_of_need, :location_id
  belongs_to :cause
  has_one :campaign
  belongs_to :location

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/missing.jpeg"

  serialize :settings, JSON

  include Smooth::Presentable


  PastTenseActions = {
    "followers" => "Followers",
    "volunteers" => "Volunteers",
    "cash_donations" => "Dollars",
    "goods_donations" => "Donations"
  }

  GivingActions = {
    "followers" => "Promote",
    "volunteers" => "Volunteer",
    "cash_donations" => "Donate",
    "goods_donations" => "Give"
  }

  validates_inclusion_of :type_of_need, :in => GivingActions.keys

  #can_be_queried_by :cause_id
  #can_be_queried_by :type

  def self.need_types
    ['followers','goods_donations', 'cash_donations', 'volunteers']
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

