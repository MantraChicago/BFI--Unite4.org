class FeaturedCause < ActiveRecord::Base
  attr_accessible :cause_id
  include Smooth::Queryable
  include Smooth::Presentable

  has_many :causes

  scope :top_three, lambda { limit(3).reorder("updated_at DESC") }
  scope :top_four, lambda { limit(4).reorder("updated_at DESC") }

  def self.featured count=4
    top_four
  end

  def self.cause_ids
    scoped.select("distinct cause_id").map(&:cause_id)
  end

  # can't really query this model
  def self.query(params={})
    top_four
  end

  def self.populate!
    delete_all
    causes = Cause.reorder("random()").limit(4)

    causes.each do |cause|
      create(cause_id: cause.id)
    end
  end
end

# == Schema Information
#
# Table name: featured_causes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cause_id   :integer
#

