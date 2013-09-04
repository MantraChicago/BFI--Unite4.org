require 'spec_helper'

describe City do
  before :all do
    City.create_defaults
  end
  
  it 'should return the closest city' do
    closet_cities=City.get_closest_citys_flat_euclidean 41.8819, -87.6278
    
    closet_cities[0].slug.should == 'chicago'
  end
end
