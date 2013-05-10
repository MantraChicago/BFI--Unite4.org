class ProfilesController < ApplicationController

	def index

		if user_signed_in?
			@user=User.find(current_user.id)
		else
			render "noAccount"
		end

	end

	def update
		params[:user] ||= {}
		params[:user][:cause_ids] ||= []

		@user=User.find(current_user.id)
		if(@user.update_attributes params[:user])
			redirect_to profiles_path, :notice => "You have successfully updated your profile" 
		else
			# todo
		end
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
