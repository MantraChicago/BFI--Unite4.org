class UserPresenter
  def self.default
    [:id]
  end

  def self.profile
    [
      :id,
      :email,
      :followed_causes_ids,
      :first_name,
      :last_name,
      :city,
      :state,
      :bio
    ]
  end

  def self.user_profile
    profile + [:authentication_token]
  end

end
