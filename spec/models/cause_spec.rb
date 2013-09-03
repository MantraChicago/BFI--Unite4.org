require "spec_helper"

describe Cause do
  before(:all) do
    Campaign.delete_all
    Cause.delete_all
    CauseType.delete_all
    Location.delete_all
    Need.delete_all

    cause_type = create(:cause_type)
    other_cause_type = create(:cause_type)

    Unite::Development.create_sample_causes_and_locations_in(:chicago, cause_type: cause_type, count: 1)
    Unite::Development.create_sample_causes_and_locations_in(:new_york, cause_type: cause_type, count: 1)
    Unite::Development.create_sample_causes_and_locations_in(:san_francisco, cause_type: other_cause_type, count: 1)
  end


  let(:cause_type) { CauseType.first }
  let(:other_cause_type) { CauseType.last }
  let(:cause) { Cause.first || create(:cause)}


  

  it "should have a default location" do
    cause.locations.should_not be_empty
  end

  it "should have a default social need" do
    cause.needs.first.type.should == 'FollowerNeed' 
  end

  it "should allow me to filter by city" do
    Cause.query(near:'Chicago').count.should == 1
  end

  it "should allow me to filter by cause type" do
    Cause.query(cause_type_id: cause_type.id).count.should == 2
  end

  it "should allow me to filter by cause type and city" do
    Cause.query(near:"New York",cause_type_id: other_cause_type.id).count.should == 0
    Cause.query(near:"San Francisco",cause_type_id: other_cause_type.id).count.should == 1
  end

  it "should allow me to filter by cause type slug" do
    results = Cause.by_cause_type(cause_type.slug)
    results.count.should == cause_type.causes.count
  end

  it "should allow me to filter by city slug" do
    Cause.by_city_slug('chicago').count.should == 3
  end

  it "should allow me to filter by scope" do
    results = Cause.query(scope:['by_cause_type', cause_type.slug])
    results.count.should == cause_type.causes.count
  end

end

# == Schema Information
#
# Table name: causes
#
#  id                    :integer          not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  name                  :string(255)
#  description           :text
#  mission_statement     :text
#  how_hear              :text
#  phone_number          :string(255)
#  email                 :string(255)
#  website               :string(255)
#  cause_type_id         :integer
#  city                  :string(255)
#  region                :string(255)
#  video_link            :string(255)
#  picture_file_name     :string(255)
#  picture_content_type  :string(255)
#  picture_file_size     :integer
#  picture_updated_at    :datetime
#  is_featured           :boolean          default(FALSE)
#  twitter_handle        :string(255)
#  facebook_url          :string(255)
#  active                :boolean
#  display_name          :string(255)
#  address_line_one      :string(255)
#  address_line_two      :string(255)
#  postal_code           :string(255)
#  country               :string(255)
#  locations_count       :integer          default(0)
#  needs_count           :integer          default(0)
#  donations_count       :integer          default(0)
#  volunteers_count      :integer          default(0)
#  followers_count       :integer          default(0)
#  slug                  :string(255)
#  cash_donations_count  :integer          default(0)
#  goods_donations_count :integer          default(0)
#  city_slug             :string(255)
#  short_description     :string(255)
#  contact_email         :string(255)
#  user_id               :integer
#

