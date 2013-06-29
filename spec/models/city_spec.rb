require 'spec_helper'

describe City do
  it "should be able to lookup a city by name" do
    City["Chicago"].should be_present
    City["San Francisco"].should be_present
    City["New York"].should be_present
  end

  it "should return the coordinates of a city" do
    City.coordinates_for("Chicago").should be_a(Array)
  end
end
