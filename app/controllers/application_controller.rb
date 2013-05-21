class ApplicationController < ActionController::Base
  protect_from_forgery

  def recordAction action, params={}
    if current_user
      $customerio.track(current_user.id, action, params) 
    end   
  end

end
