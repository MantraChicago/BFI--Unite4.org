class CauseImage < ActiveRecord::Base
  attr_accessible :cause_id, :picture, :caption

  has_attached_file :picture, :styles => {:large =>'500x500', :medium => "300x300>", :thumb => "100x100>" }, 
                              :default_url => "/assets/missing.jpeg",
                              :convert_options => {
                                :thumb => "-quality 75 -strip" }

  belongs_to :cause
end

# == Schema Information
#
# Table name: cause_images
#
#  id                   :integer          not null, primary key
#  cause_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  caption              :text
#

