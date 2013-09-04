class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :determine_nearest_cities
  
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

  def determine_nearest_cities
    if !cookies[:closest_cities]
      geo_ip_location=$GeoIpLocation.look_up(request.remote_ip) || {:latitude=>41.8819, :longitude=>87.6278 } 
      closest_cities= City.get_closest_citys_flat_euclidean(geo_ip_location[:latitude], geo_ip_location[:longitude]).as_json
      cookies[:closest_cities]=closest_cities
    end
    @closest_cities= cookies[:closest_cities]

    if !cookies[:closest_city_id]
      cookies[:closest_city_id]=@closest_cities[0]['id']
    end
    @closest_city= City.find cookies[:closest_city_id]
    #binding.pry
  end
end
