class FeaturedCause < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  has_many :causes

  scope :top_three, lambda { limit(3).reorder("updated_at DESC") }

  # can't really query this model
  def self.query(params={})
    top_three
  end
end
