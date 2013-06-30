class Volunteer < ActiveRecord::Base
   attr_accessible :email,:first_name, :last_name, :volunteer_need_id, :phone_number
   has_one :volunteer_need

   validates :first_name, :last_name, :presence => true

    
end

# == Schema Information
#
# Table name: volunteers
#
#  id                :integer          not null, primary key
#  first_name        :string(255)
#  last_name         :string(255)
#  phone_number      :string(255)
#  volunteer_need_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  email             :string(255)
#

