require 'spec_helper'

describe "Api::Needs" do
  describe "GET /api_needs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get api_needs_path
      response.status.should be(200)
    end
  end
end
