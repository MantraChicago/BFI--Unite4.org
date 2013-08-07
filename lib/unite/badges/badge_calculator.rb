class Unite::Badges::BadgeCalculator
  def self.calculate_all_badges_for_all_users
    Badge.all.each do |badge|
      badge_calculator_class_name= "Unite::Badges::BadgeCalculator::#{badge.generate_badge_calculator_class_name}"
      if class_exists? badge_calculator_class_name    
        badge_calculator_class = badge_calculator_class_name.constantize
        User.all.each do |user|
          self.calculate_badge_for_user(user, badge, badge_calculator_class)
        end
      end
    end
  end

  def self.calculate_badge_for_user(user,badge, badge_calculator_class)  
    if !user.badges.all.include? badge
      earned_badge=badge_calculator_class.calculate user
      if earned_badge
        puts "Badge #{badge.name} given to #{user.display_name}"
        user.badges << badge
        user.save
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
