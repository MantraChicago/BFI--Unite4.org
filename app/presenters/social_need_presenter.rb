class SocialNeedPresenter
  def self.default
    SocialNeed.column_names.map(&:to_sym)
  end
end
