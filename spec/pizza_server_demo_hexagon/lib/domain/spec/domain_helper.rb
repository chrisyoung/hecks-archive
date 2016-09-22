require_relative '../lib/pizza_server_demo_hexagon_domain'
RSpec.configure do |config|
  config.after(:each) do
    PizzaServerDemoHexagon::Domain.repositories.values.each do |repo|
      repo.delete_all
    end
  end
end
