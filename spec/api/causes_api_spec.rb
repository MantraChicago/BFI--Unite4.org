require "spec_helper"

describe "The Causes Resource API", :type => :api do
  it "should work" do
    get "/api/v1/causes/default"
    binding.pry
  end
end
