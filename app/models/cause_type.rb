class CauseType < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :causes, :join_table => 'causes_cause_types'

  attr_accessible :picture
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing_cause_type.jpg"
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

