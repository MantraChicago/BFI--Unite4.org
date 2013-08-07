class Unite::Badges::BadgeCalculator::GettingOutThereCalculator
  def self.calculate user
    Contribution.where('user_id' => user.id, 'need_type'=>'volunteers').count >0
  end
end