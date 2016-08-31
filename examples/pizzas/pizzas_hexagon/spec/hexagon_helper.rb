require_relative '../lib/pizzas_hexagon/'

RSpec.configure do |config|
  config.after(:each) do
    Pizzas::App.new.delete_all
  end
end
