class Unite::Badges::BadgeCalculator::GoodieGoodieCalculator
  def self.calculate user
    Contribution.where('user_id' => user.id, 'need_type'=>'cash_donations').count >0
  end
end