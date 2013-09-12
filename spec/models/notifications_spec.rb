require "spec_helper"

describe Notification do
  it "should be able to create new notifications" do
    user = FactoryGirl.create(:user)
    message = 'test'
    Notification.give_user_notification(user.id,message)
    user.notifications.last.message.should == message
  end

end