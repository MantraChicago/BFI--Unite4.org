class Unite::Badges::BadgeCalculator::KeepingTabsCalculator < Unite::Badges::BadgeCalculator::BaseBadgeCalculator
  def self.should_award user
    followed_cause= user.causes.first
    if followed_cause
      {cause_id:followed_cause.id}
    end
  end
end