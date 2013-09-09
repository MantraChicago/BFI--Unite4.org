class Unite::Badges::BadgeCalculator::BaseBadgeCalculator
  def self.calculate user,badge
    award_hash= should_award user
    if award_hash
      create_badge_for_user(badge,user,award_hash)
    end
  end

  def self.create_badge_for_user(badge,user, award_hash=nil)
    save_hash = {user_id:user.id, badge_id:badge.id }.merge(award_hash)
    user_badge=UserBadge.create(save_hash)
    user.user_badges<<user_badge
  end


end