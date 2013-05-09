class ProfilesController < ApplicationController

	def index
		unless user_signed_in?
			render "noAccount"
		end

		@user=User.find(current_user.id)
		@causes=Cause.find(:all)
	end

	def edit
		#format.html { render :action => "success" }
	    @user = User.find(current_user.id)
	    

	    if @user.update_attributes(params[:user]) and params[:user]
	        redirect_to profiles_path, :notice => "You have successfully updated your profile" 
	    else
	        render :action => "edit" 
	    end

	end

end
