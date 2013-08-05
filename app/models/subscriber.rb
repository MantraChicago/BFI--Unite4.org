class Subscriber < ActiveRecord::Base
  validates :email, :presence => true
  attr_accessible :email
end

# == Schema Information
#
# Table name: subscribes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#

