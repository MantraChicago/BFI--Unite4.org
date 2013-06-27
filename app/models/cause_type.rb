class CauseType < ActiveRecord::Base
  attr_accessible :name, :picture_url
  has_and_belongs_to_many :causes, :join_table => 'causes_cause_types'

  attr_accessible :picture

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing_cause_type.jpg"

  after_find :add_picture_url

  def self.cause_ids_for_cause_type cause_type_id
    connection.execute "SELECT distinct cause_id FROM causes_cause_types WHERE id = '#{ cause_type_id.to_i }'"
  end

  def add_picture_url
    self[:picture_url] = picture.url
  end

  def self.random(count=1)
    order("random()").limit(1).first
  end
end

# == Schema Information
#
# Table name: cause_types
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

