module FactoryHelpers
  def create_sample_causes_in city=:chicago
    Unite::Development.create_sample_causes_and_locations_in(city)
  end
end
