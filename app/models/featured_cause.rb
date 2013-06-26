class FeaturedCause < ActiveRecord::Base
  attr_accessible :cause_id
  include Smooth::Queryable
  include Smooth::Presentable

  has_many :causes

  scope :top_three, lambda { limit(3).reorder("updated_at DESC") }

  # can't really query this model
  def self.query(params={})
    top_three
  end
end

# == Schema Information
#
# Table name: featured_causes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

