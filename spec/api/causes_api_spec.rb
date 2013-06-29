require "spec_helper"

describe "The Causes Resource API", :type => :api do
  before(:all) do
    Unite::Development.create_sample_causes_and_locations_in(:chicago, 3)
    Unite::Development.create_sample_causes_and_locations_in(:new_york, 2)
    Unite::Development.create_sample_causes_and_locations_in(:san_francisco, 1)
  end

  let(:parsed) { JSON.parse(response.body) }

  it "should return a list of causes" do
    get "/api/v1/causes/default"
    response.should be_success
    parsed.length.should == 6
  end

  it "should allow me to filter by city" do
    get "/api/v1/causes?near=Chicago"
    parsed.length.should == 3
  end

  it "should allow me to filter by cause type" do

  end


end
