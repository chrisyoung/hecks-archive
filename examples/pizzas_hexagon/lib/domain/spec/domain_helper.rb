require_relative '../lib/pizzas_domain'
RSpec.configure do |config|
  config.after(:each) do
    Pizzas::Domain.repositories.values.each do |repo|
      repo.delete_all
    end
  end
end