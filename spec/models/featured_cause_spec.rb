require "spec_helper"

describe FeaturedCause do
  before(:all) { 5.times { create(:cause, :skip_default_location => true) } }

  it "should interface with the cause model" do
    FeaturedCause.populate!
    FeaturedCause.cause_ids.should_not be_empty
  end
end

# == Schema Information
#
# Table name: featured_causes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cause_id   :integer
#

