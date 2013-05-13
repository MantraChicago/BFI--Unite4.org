class Volunteer < ActiveRecord::Base
   attr_accessible :first_name, :last_name, :volunteer_need_id, :phone_number
   has_one :volunteer_need
end
