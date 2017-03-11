require 'rack/test'

ENV['RACK_ENV'] = 'test'
module RSpecMixin
  include Rack::Test::Methods

  def app
    adapter = Hecks::Application.new(
      domain: PizzaBuilder
    )
    described_class.new(application_adapter: adapter)
  end
end

RSpec.configure { |c| c.include RSpecMixin }
