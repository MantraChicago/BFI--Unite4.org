class ApplicationController < ActionController::Base
  protect_from_forgery

  def getRecentNeeds

   		allNeeds=[]
   		for needModel in [VolunteerNeed, SocialNeed, DonationsNeed, GoodNeed]
   			needs = needModel.all
   			needs.each do |need|
   				allNeeds.push(need)
   			end
   		end
   		allNeeds

  end

  def recordAction action, params={}
    if current_user
      $customerio.track(current_user.id, action, params) 
    end   
  end

end
