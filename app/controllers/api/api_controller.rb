class Api::ApiController < ActionController::Base
  protect_from_forgery
  
  #after_filter render_json
  def all_data
  	causes=Cause.all
  	needs =Need.all

  	render :json =>{:causes=> causes,
  					:needs =>needs}	
  end

  def render_json
  	render :json => @json_data	
  end


end