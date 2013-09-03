require "spec_helper"

describe "The Causes Resource API", :type => :api do

  before(:all) do
    Cause.delete_all
    CauseType.delete_all

    cause_type = create(:cause_type)
    other_cause_type = create(:cause_type)

    Unite::Development.create_sample_causes_and_locations_in(:chicago, cause_type: cause_type, count: 1)
    Unite::Development.create_sample_causes_and_locations_in(:new_york, cause_type: cause_type, count: 1)
    Unite::Development.create_sample_causes_and_locations_in(:san_francisco, cause_type: other_cause_type, count: 1)
  end

  let(:cause_type) { CauseType.first }
  let(:other_cause_type) { CauseType.last }

  let(:parsed) { JSON.parse(response.body) }

  it "should return a list of causes" do
    get "/api/v1/causes/default"
    response.should be_success
    parsed.length.should == 3
  end

  it "should present the causes using the details presenter" do
    get "/api/v1/causes/details"
    response.should be_success
    parsed.first.keys.should include("locations_details")
  end

  it "should allow me to filter by city" do
    get "/api/v1/causes", :near => "Chicago"
    parsed.length.should == 1
  end

  it "should allow me to filter by cause type" do
    get "/api/v1/causes", :cause_type_id => cause_type.id
    parsed.length.should == 2
  end

  it "should allow me to filter by cause type and city" do
    get "/api/v1/causes", :cause_type_id => other_cause_type.id, :near => "New York"
    parsed.length.should == 0
  end

  it "should allow me to filter by cause type and city" do
    get "/api/v1/causes", :cause_type_id => cause_type.id, :near => "New York"
    parsed.length.should == 1
  end

end
