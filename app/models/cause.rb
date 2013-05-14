class Cause < ActiveRecord::Base
   attr_accessible :video_link,:is_featured,:picture,:city, :state, :name, :description, :mission_statement, :how_hear, :email, :website, :phone_number, :cause_type_id
   
   has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

   has_many :volunteer_needs, :dependent => :delete_all
   has_many :social_needs, :dependent => :delete_all
   has_many :donations_needs, :dependent => :delete_all
   has_many :good_needs, :dependent => :delete_all
   
   belongs_to :cause_type
   has_many :locations, :dependent => :delete_all

   def allNeeds
   		allNeeds=[]
   		for needType in ['volunteer_needs', 'social_needs', 'donations_needs', 'good_needs']
   			needs=self.send("#{needType}")
   			if needs.count>0
   				allNeeds.push(needs)
   			end
   		end
   		allNeeds
   end
end
