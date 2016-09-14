ENV['RACK_ENV'] = 'test'
HEX = PizazHexagon::App.new

module PizazHexagonMixin
  include Rack::Test::Methods
  def app()
    PizazHexagon::Adapters::ResourceServer::App.new(hexagon: HEX)
  end
end

RSpec.configure do |config|
  config.include PizazHexagonMixin
  config.after(:each) do
    PizazHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
