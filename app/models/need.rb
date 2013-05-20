class Need < ActiveRecord::Base
  attr_accessible :name,  :cause_id, :description, :picture, :address, :start_date, :end_date
  #belongs_to :needable, :polymorphic => true
  belongs_to :cause
end