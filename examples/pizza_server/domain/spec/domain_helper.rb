require_relative '../lib/pizza_hexagon_domain'
RSpec.configure do |config|
  config.after(:each) do
    PizzaHexagon::Domain.repositories.each do |repo|
      repo.delete_all
    end
  end
end
