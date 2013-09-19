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
		@user=User.find(params[:id])
	end


	def update
		@user = User.find(current_user.id)
		method= 'update_attributes'
		current_password = params[:user][:current_password]
		if current_password # changing password
			method='update_with_password'

			if !@user.valid_password?(current_password)
				redirect_to profiles_path, :notice => "Your current password is incorrect" 
				return
			end
			#@user.current_password= current_password
			params[:user].delete :current_password

		end

    if @user.send(method, params[:user]) 
        redirect_to profiles_path, :notice => "You have successfully updated your profile" 
    else
        redirect_to profiles_path, :notice => "There was an error updating your profile" 
    end

	end

	def edit
		@user = User.find(current_user.id)

	end

	private

  def user_params #https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-edit-their-password
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end

	

end
