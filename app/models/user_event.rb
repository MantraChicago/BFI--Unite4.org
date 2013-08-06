class UserEvent < ActiveRecord::Base
  attr_accessible :url, :cause_id, :user_id, :contribution_id, :name
  
end