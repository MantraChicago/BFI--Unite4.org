require 'spec_helper'

describe 'needs_modal' do 
  #let(:cause) { create(:cause) }

  describe 'User should have to be logged in to see need modal' do
    cause = create(:cause)
    visit url_for(cause)
  end

end