require 'rack/test'
require_relative '../lib/adapters/resource_server/app'


ENV['RACK_ENV'] = 'test'
module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class.new(domain: PizzaBuilder)
  end
end

RSpec.configure { |c| c.include RSpecMixin }
