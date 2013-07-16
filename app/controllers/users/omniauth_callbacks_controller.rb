class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
	    @user = User.find_or_create_from_facebook(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
	      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	    else
        raise "Should never be here!"
	    end
	  end
end
