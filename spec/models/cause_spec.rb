require "spec_helper"

describe Cause do
  before(:all) do
    Cause.destroy_all
  end

  let(:cause) { create(:cause) }

  it "should have a default campaign" do
    cause.active_campaign.should be_present
  end

  it "should have a default location" do
    cause.locations.should_not be_empty
  end

  it "should have a default social need" do
    cause.needs.first.should be_a(SocialNeed)
  end

end


# == Schema Information
#
# Table name: causes
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  name                 :string(255)
#  description          :text
#  mission_statement    :text
#  how_hear             :text
#  phone_number         :string(255)
#  email                :string(255)
#  website              :string(255)
#  cause_type_id        :integer
#  city                 :string(255)
#  state                :string(255)
#  video_link           :string(255)
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  is_featured          :boolean          default(FALSE)
#  twitter_handle       :string(255)
#  facebook_url         :string(255)
#  city_id              :integer
#  active               :boolean
#  display_name         :string(255)
#

