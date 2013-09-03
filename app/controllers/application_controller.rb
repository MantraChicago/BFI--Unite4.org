class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => request.protocol)
    if request.referer == sign_in_url || resource.class.name== 'User' || (request.referer && request.referer.match(/\/users\//) )
      root_path
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def cause_edit_auth
     @cause= (params[:cause_slug] && Cause.find(params[:cause_slug]) ) || Need.find(params[:id]).cause
     authenticate_user!
     if @cause.user != current_user
       redirect_to '/', :alert => 'You are not allowed to edit this cause'
     end
  end
end
