require "spec_helper"

describe Cause do
  before(:all) do


    cause_type = create(:cause_type)
    other_cause_type = create(:cause_type)

  end


  let(:cause_type) { CauseType.first }
  let(:other_cause_type) { CauseType.last }
  let(:cause) { create(:cause)}
  

  it "should allow me to filter by cause type" do
    cause_type_id=cause.cause_types.first.id
    Cause.query(cause_type_id: cause_type_id).count.should == CauseType.find(cause_type_id).causes.count
  end
=begin
  it "should allow me to filter by cause type and city" do
    Cause.query(near:"New York",cause_type_id: other_cause_type.id).count.should == 0
    Cause.query(near:"San Francisco",cause_type_id: other_cause_type.id).count.should == 1
  end
=end
  it "should allow me to filter by cause type slug" do
    results = Cause.by_cause_type(cause_type.slug)
    results.count.should == cause_type.causes.count
  end

  it "should allow me to filter by city slug" do
    Cause.by_city_slug('chicago').count.should == City.find_by_slug('chicago').causes.count
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

