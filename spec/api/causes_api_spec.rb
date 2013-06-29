require "spec_helper"

describe "The Causes Resource API", :type => :api do
  before(:all) do
    create_sample_causes_in(:chicago)
    create_sample_causes_in(:new_york)
  end

  it "should return a list of causes" do
    get "/api/v1/causes"
    response.should be_success
  end

  it "should allow me to query by cause type" do
    get "/api/v1/causes", :cause_type_id => cause_type.id
    results = JSON.parse(response.body)
  end

  it "should allow me to query by zip code" do
    get "/api/v1/causes", :zip_code => "60010"
    results = JSON.parse(response.body)
    results.should_not be_empty
  end

  it "should allow me to query by latitude and longitude" do
    get "/api/v1/causes", :near => "60010"
    results = JSON.parse(response.body)
    binding.pry

    names = results.map {|r| r["name"] }
    names.should include("The People's Champ")
  end

  it "should allow me to query by city" do
    get "/api/v1/causes", :near => "Chicago"
    results = JSON.parse(response.body)
    names = results.map {|r| r["name"] }
    names.should_not include("We gettin Money")
  end
end
