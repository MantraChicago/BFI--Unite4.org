class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  #DeviseController.respond_to :html, :json #for ajax login

end
