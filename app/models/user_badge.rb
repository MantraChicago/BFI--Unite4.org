class UserBadge < ActiveRecord::Base
  attr_accessible :user_id, :cause_id, :badge_id, :need_id, :number
  belongs_to :user
  belongs_to :cause
  belongs_to :badge
  belongs_to :need

  after_create :send_user_notification

  def formatted_description
    description= badge.description_after
    description.gsub!(/\$DATE/,formatted_date) if formatted_date
    description.gsub!(/\$CAUSE/,cause.display_name) if cause 
    description.gsub!(/\$NUMBER/,number) if number
    description
  end

  def formatted_date
    created_at.to_time.strftime('%B %e %Y') if created_at
  end

  def send_user_notification
    Notification.give_user_notification(user_id,badge.name, :title => 'You earned a badge!' ,
                                                            :img_link => "/assets/badges/badge_#{badge.file_name}", 
                                                            :link => 'View all your badges <a href="/profiles">here</a>' )
  end  
end