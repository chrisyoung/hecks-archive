RSpec.configure do |config|
  config.after(:each) do
    PizzaHexagon.new.delete_all
  end
end
