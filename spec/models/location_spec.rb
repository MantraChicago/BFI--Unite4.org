require "spec_helper"

describe Location do
  let(:cause) { create(:cause,:skip_default_location=>true) }
  let(:location) { create(:location, cause: cause) }

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
