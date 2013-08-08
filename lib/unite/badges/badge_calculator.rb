class Unite::Badges::BadgeCalculator
  def self.calculate_all_badges_for_users(badges, users)
    users.all.each do |user|
      calculate_badges_for_user(user, badges)
    end
  end

  def self.calculate_badges_for_user(user, badges) 
    badges.each do |badge|
      badge_calculator_class_name= "Unite::Badges::BadgeCalculator::#{badge.generate_badge_calculator_class_name}" 
      if !(user.badges.all.include?(badge)) &&  class_exists?(badge_calculator_class_name)
        badge_calculator_class = badge_calculator_class_name.constantize
        badge_calculator_class.calculate user, badge   
      end
    end
  end

  def self.class_exists?(name)
    begin
      true if name.constantize
    rescue NameError
      false
    end
  end
end
