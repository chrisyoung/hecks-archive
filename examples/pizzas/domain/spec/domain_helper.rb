require_relative '../lib/domain'
RSpec.configure do |config|
  config.after(:each) do
    PizzaHexagon::Domain.repositories.values.each do |repo|
      repo.delete_all
    end
  end
end
