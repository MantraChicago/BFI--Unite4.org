require 'spec_helper'

describe CauseImage do
  pending "add some examples to (or delete) #{__FILE__}"
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

