require_relative '../lib/pizza_server_x_hexagon_domain'
RSpec.configure do |config|
  config.after(:each) do
    PizzaServerXHexagon::Domain.repositories.values.each do |repo|
      repo.delete_all
    end
  end
end
