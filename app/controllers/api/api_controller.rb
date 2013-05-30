class Api::ApiController < ActionController::Base
  protect_from_forgery
  
  #after_filter render_json
  def all_data

  	render :json =>{:causes=> Cause.all,
  					:locations =>Location.all,
  					:needs =>Need.all}	
  end

  def render_json
  	render :json => @json_data	
  end


end