class Campaign < ActiveRecord::Base
  belongs_to :cause
  belongs_to :need

  scope :active, lambda { where(active:true) }
  scope :inactive, lambda { where(active:false) }
end
