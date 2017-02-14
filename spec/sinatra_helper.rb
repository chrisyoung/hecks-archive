require 'rack/test'
require_relative '../lib/adapters/resource_server/resource_server'


ENV['RACK_ENV'] = 'test'
module RSpecMixin
  include Rack::Test::Methods

  def app
    adapter = Hecks::Adapters::Application.new(
      domain: PizzaBuilder
    )
    described_class.new(application_adapter: adapter)
  end
end

RSpec.configure { |c| c.include RSpecMixin }
