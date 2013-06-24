class Need < ActiveRecord::Base
  attr_accessible :name,  :cause_id, :description, :picture, :address, :start_date, :end_date
  belongs_to :cause
  has_one :campaign

  
end

# == Schema Information
#
# Table name: needs
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  type                 :string(255)
#  cause_id             :integer
#  description          :text
#  start_date           :datetime
#  end_date             :datetime
#  address              :string(255)
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

