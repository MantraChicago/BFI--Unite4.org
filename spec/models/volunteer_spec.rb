require 'spec_helper'

describe Volunteer do
  it "should increment the campaign by 1" do
    Volunteer.new.contribution_increment.should == 1
  end
end

# == Schema Information
#
# Table name: volunteers
#
#  id             :integer          not null, primary key
#  cause_id       :integer
#  user_id        :integer
#  need_id        :integer
#  location_id    :integer
#  description    :string(255)
#  user_showed_up :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

