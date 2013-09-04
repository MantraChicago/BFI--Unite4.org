require 'spec_helper'

describe City do

  it 'should return the closet city' do
    City.create_defaults
    closet_cities=City.get_closest_citys_flat_euclidean 41.8819, 87.6278
    
    closet_cities[0].slug.should == 'chicago'
  end
end
