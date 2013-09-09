class Notification < ActiveRecord::Base
  attr_accessible :message, :link, :img_link, :user_id, :title
  belongs_to :user

  def self.give_user_notification(user_id,message,options={})
    save_hash={user_id:user_id,
               message:message}.merge options
    Notification.create(save_hash)
  end
end