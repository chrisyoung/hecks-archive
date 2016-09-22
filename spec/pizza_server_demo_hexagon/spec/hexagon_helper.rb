require_relative '../lib/pizza_server_demo_hexagon/'
require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.after(:each) do
    PizzaServerDemoHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
