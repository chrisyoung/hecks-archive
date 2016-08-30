require_relative '../lib/pizza_hexagon/'

RSpec.configure do |config|
  config.after(:each) do
    PizzaHexagon::App.new.delete_all
  end
end
