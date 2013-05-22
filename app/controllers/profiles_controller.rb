class ProfilesController < ApplicationController

	def index

		if user_signed_in?
			@user=User.find(current_user.id)
			@allow_edit=true
			@featured_causes=Cause.find_all_by_is_featured(true);
			render :show
		else
			redirect_to root_path, :notice => "You don't have a profile" 
		end

	end

	def show
		@featured_causes=Cause.find_all_by_is_featured(true);
		@user=User.find(params[:id])
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

	def follow_cause 
		if not user_signed_in?
			session["user_return_to"] = request.url
			redirect_to new_user_registration_path, :notice => "You need to have an account to follow a cause." 
		else
			user=User.find(current_user.id)
			cause = Cause.find(params[:id])
			unless user.causes.include? cause
				user.causes << cause
				user.save
			end
			redirect_to cause, :notice => "You are now following "+cause.name 
		end
	end

	def edit
	    @user = User.find(current_user.id)

	    if @user.update_attributes(params[:user]) and params[:user]
	        redirect_to profiles_path, :notice => "You have successfully updated your profile" 
	    else
	        render :action => "edit" 
	    end

	end

end
