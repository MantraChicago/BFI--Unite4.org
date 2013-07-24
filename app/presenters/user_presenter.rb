class UserPresenter
  def self.default
    [:id]
  end

  def self.profile
    [
      :id,
      :email,
      :followed_causes_ids
    ]
  end

  def self.followed_causes_locations
    [:followed_causes_locations]
  end
end
