class Unite::Badges::BadgeCalculator::EnthusiastCalculator < Unite::Badges::BadgeCalculator::BaseBadgeCalculator
  def self.should_award user
    causes=user.causes
    if causes.count >=5
      {}
    end
  end
end