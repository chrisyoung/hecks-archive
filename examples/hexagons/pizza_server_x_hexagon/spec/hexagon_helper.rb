require_relative '../lib/pizza_server_x_hexagon/'
require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.after(:each) do
    PizzaServerXHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
