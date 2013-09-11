class Api::SessionsController < Api::ApiController
  def create
    user = User.find_by_email(params[:email])

    if user.valid_password?(params[:password])
      render :json => user.present_as(:user_profile)
    else
      render :json => {error:"Invalid authentication"}, :status => 500
    end
  end
end
