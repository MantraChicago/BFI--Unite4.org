class Unite::Badges::BadgeCalculator::KeepingTabsCalculator
  def self.calculate user
    Contribution.where('user_id' => user.id, 'need_type'=>'followers').count >0
  end
end