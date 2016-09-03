require_relative '../lib/pizzas_hexagon/'

RSpec.configure do |config|
  config.after(:each) do
    PizzasHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
