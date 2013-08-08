class Unite::Badges::BadgeCalculator::CheckingItOutCalculator < Unite::Badges::BadgeCalculator::BaseBadgeCalculator
  def self.should_award user
    user_event=UserEvent.where('user_id' => user.id, 'name'=>'cause_page_view').first
    if user_event
      {cause_id:user_event.cause_id,need_id:user_event.need_id}
    end
  end
end