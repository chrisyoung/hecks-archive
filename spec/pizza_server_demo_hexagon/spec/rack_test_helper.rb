ENV['RACK_ENV'] = 'test'
HEX = PizzaServerDemoHexagon::App.new

module PizzaServerDemoHexagonMixin
  include Rack::Test::Methods
  def app()
    PizzaServerDemoHexagon::Adapters::ResourceServer::App.new(hexagon: HEX)
  end
end

RSpec.configure do |config|
  config.include PizzaServerDemoHexagonMixin
  config.after(:each) do
    PizzaServerDemoHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
