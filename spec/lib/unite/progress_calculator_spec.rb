require "spec_helper"

describe Unite::ProgressCalculator do
  let(:campaign) { create(:campaign) }
  let(:calculator) { Unite::ProgressCalculator.new(campaign)  }
end

