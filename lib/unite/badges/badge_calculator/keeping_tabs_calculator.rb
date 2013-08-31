class Unite::Badges::BadgeCalculator::KeepingTabsCalculator < Unite::Badges::BadgeCalculator::BaseBadgeCalculator
  def self.should_award user
    contribution= Contribution.where('user_id' => user.id, 'need_type'=>'FollowerNeed').first
    if contribution
      {cause_id:contribution.cause_id,need_id:contribution.need_id}
    end
  end
end