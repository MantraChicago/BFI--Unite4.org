class Unite::Badges::BadgeCalculator::VideoVikingCalculator < Unite::Badges::BadgeCalculator::BaseBadgeCalculator
  def self.should_award user
    user_event= UserEvent.where('user_id' => user.id, 'name'=>'video_watch').first
    if user_event
      {cause_id:user_event.cause_id}
    end
  end
end