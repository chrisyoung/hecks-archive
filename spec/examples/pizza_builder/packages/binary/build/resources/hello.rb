require 'hecks'
require 'pizza_builder'
puts "Hello"

app = Hecks::Adapters::Application.new(domain: PizzaBuilder)

class Fixnum
  def positive?
    self >= 0
  end
end

puts app[:pizzas].create({
    name: 'White Pizza',
    description: 'white sauce and chicken',
    toppings: [{ name: 'chicken' }]
}).call.inspect
