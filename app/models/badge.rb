class Badge < ActiveRecord::Base
  attr_accessible :name, :description, :file_name, :accomplishment
  has_and_belongs_to_many :users, :join_table=>:badges_users
end
