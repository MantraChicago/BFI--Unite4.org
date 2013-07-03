class Need < ActiveRecord::Base
  attr_accessible :name,  :cause_id, :description, :picture, :address, :start_date, :end_date, :type_of_need
  belongs_to :cause
  has_one :campaign

  include Smooth::Presentable

  ValidTypes = %w{cash_donations goods_donations followers volunteers}

  validates_inclusion_of :type_of_need, :in => ValidTypes

  can_be_queried_by :cause_id
  can_be_queried_by :type

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
