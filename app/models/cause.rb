class Cause < ActiveRecord::Base
   attr_accessible :name, :description, :mission_statement, :how_hear, :email, :website, :phone_number, :cause_type_id

   has_and_belongs_to_many :cause_needs, :join_table => :causes_cause_need
   belongs_to :cause_type
   has_many :locations
end
