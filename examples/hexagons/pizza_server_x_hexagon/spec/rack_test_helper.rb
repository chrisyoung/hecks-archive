ENV['RACK_ENV'] = 'test'
HEX = PizzaServerXHexagon::App.new

module PizzaServerXHexagonMixin
  include Rack::Test::Methods
  def app()
    PizzaServerXHexagon::Adapters::ResourceServer::App.new(hexagon: HEX)
  end
end

RSpec.configure do |config|
  config.include PizzaServerXHexagonMixin
  config.after(:each) do
    PizzaServerXHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
