# frozen_string_literal: true
ENV['RACK_ENV'] = 'test'
HEX = PizzaServerHexagon::App.new

module PizzaServerHexagonMixin
  include Rack::Test::Methods
  def app
    PizzaServerHexagon::Adapters::ResourceServer::App.new(hexagon: HEX)
  end
end

RSpec.configure do |config|
  config.include PizzaServerHexagonMixin
  config.after(:each) do
    PizzaServerHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
