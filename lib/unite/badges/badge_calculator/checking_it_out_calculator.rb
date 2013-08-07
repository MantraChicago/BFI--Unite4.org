class Unite::Badges::BadgeCalculator::CheckingItOutCalculator
  def self.calculate user
    UserEvent.where('user_id' => user.id, 'name'=>'cause_page_view').count >0
  end
end