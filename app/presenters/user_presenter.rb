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
end
