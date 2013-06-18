class FeaturedCause < ActiveRecord::Base
  has_many :causes

  scope :top_three, lambda { limit(3).reorder("updated_at DESC") }

end
