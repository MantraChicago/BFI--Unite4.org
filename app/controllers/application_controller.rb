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
=begin
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
=end
end
