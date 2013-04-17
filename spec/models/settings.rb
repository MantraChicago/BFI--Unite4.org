require 'spec_helper_no_rails'
require 'active_support/string_inquirer'
require 'models/settings'

describe Settings do

  let(:env) { {} }
  let(:rails_env) { 'test' }
  let(:rails) { stub(:rails, env: ActiveSupport::StringInquirer.new(rails_env)) }

  subject(:settings) { described_class.instance }

  before do
    stub_const('ENV', env)
    stub_const('Rails', rails)
  end

  it 'forwards class methods to the instance' do
    settings.public_methods(false).each do |method|
      expect(described_class).to respond_to(method)
    end
  end

end
