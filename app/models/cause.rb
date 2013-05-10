class Cause < ActiveRecord::Base
   attr_accessible :name, :description, :mission_statement, :how_hear, :email, :website, :phone_number, :cause_type_id
   
   has_many :volunteer_needs
   has_many :social_needs
   has_many :donations_needs
   has_many :good_needs
   

   belongs_to :cause_type
   has_many :locations

   def allNeeds
   		allNeeds=[]
   		for needType in ['volunteer_needs', 'social_needs', 'donations_needs', 'good_needs']
   			needs=self.send("#{needType}")
   			if needs
   				allNeeds.push(needs)
   			end
   		end
   		allNeeds
   end
end
