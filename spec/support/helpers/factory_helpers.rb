module FactoryHelpers
  def create_sample_causes_in city
    if city == :chicago
      [{
        city: "Chicago",
        lat:0,
        lng:0
      }]
    end

    if city == :new_york
    end
  end
end
