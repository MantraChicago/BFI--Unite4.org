require 'spec_helper'

describe City do

  it 'should return the closet city' do
    City.create_defaults
    closet_city=City.get_closest_city_flat_euclidean 41.8819, 87.6278
    closet_city.slug.should == 'chicago'
  end
end
