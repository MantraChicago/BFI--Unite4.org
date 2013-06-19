class CauseType < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :causes, :join_table => 'causes_cause_types'
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

