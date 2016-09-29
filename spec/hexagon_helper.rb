require_relative '../lib/pizza_server_hexagon/'
require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.after(:each) do
    PizzaServerHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
