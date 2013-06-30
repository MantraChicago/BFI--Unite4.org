require "spec_helper"

describe Location do
  let(:location) { create(:location) }

  describe "Performing GeoQueries" do
    it "should convert degrees 2 radians" do
      Location.deg2rad(37.47080).should be_a(Float)
    end

    it "should return an empty scope if i pass it something that can't be geocoded" do
      Location.near("Barrington").count.should == 0
    end
  end

  it "should mark itself as requiring a geolocation lookup" do
    location.zip = '90210'
    location.skip_geocoding = false
    location.should be_should_geocode
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
#  region           :string(255)
#  postal_code      :string(255)
#  country          :string(255)
#

