ENV['RACK_ENV'] = 'test'
HEX = PizzasHexagon::App.new

module PizzasHexagonMixin
  include Rack::Test::Methods
  def app()
    PizzasHexagon::Adapters::ResourceServer::App.new(hexagon: HEX)
  end
end

RSpec.configure do |config|
  config.include PizzasHexagonMixin
  config.after(:each) do
    PizzasHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
