require "spec_helper"

describe Location do
  it "should convert degrees 2 radians" do
    Location.deg2rad(37.47080).should be_a(Float)
  end

  it "should return an empty scope if i pass it something that can't be geocoded" do
    Location.near("Barrington").count.should == 0
  end
end


# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cause_id         :integer
#  latitude         :float
#  longitude        :float
#  name             :string(255)
#  address_line_one :string(255)
#  address_line_two :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip              :string(255)
#  country          :string(255)
#

