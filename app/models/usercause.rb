class Usercause < ActiveRecord::Base
  attr_accessible :user_id, :cause_id
  belongs_to :user
  belongs_to :cause
end

# == Schema Information
#
# Table name: usercauses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cause_id   :integer
#  user_id    :integer
#

