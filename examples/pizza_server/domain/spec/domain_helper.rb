require_relative '../lib/pizza_hexagon_domain'
RSpec.configure do |config|
  config.after(:each) do
    PizzaHexagon::Domain.constants.each do |name|
      PizzaHexagon::Domain.const_get(name).const_get(:Repository).delete_all
    end
  end
end
