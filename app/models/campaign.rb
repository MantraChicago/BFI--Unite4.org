class Campaign < ActiveRecord::Base
  belongs_to :cause
  belongs_to :need
end
