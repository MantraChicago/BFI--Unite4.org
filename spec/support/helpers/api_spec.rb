module ApiSpecType
  include Rack::Test::Methods

  def app
    Rails.application
  end
end

RSpec.configure do |c|
  c.include ApiSpecType, :type => :api
end
