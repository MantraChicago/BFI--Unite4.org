class Promotion < ActiveRecord::Base
  include Unite::Fulfillment

  attr_accessible :need_id, :user_id, :cause_id, :message, :method
  belongs_to :cause, :counter_cache => true
  belongs_to :need
  belongs_to :user, :counter_cache => true

end