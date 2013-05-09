class Cause < ActiveRecord::Base
   attr_accessible :name, :description, :mission_statement, :how_hear, :email, :website, :phone_number, :cause_type_id
   
   has_many :cause_causeneeds
   has_many :causeneeds, :through => :cause_causeneeds

   belongs_to :cause_type
   has_many :locations
end
