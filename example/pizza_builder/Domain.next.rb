require 'pry'
require 'erubis'
require_relative 'lib/next_domain'

next_domain('Pizzeria') do
  aggregate :Pizzas do
    head :Pizza do 
      string_value :name
      string_value :description
      entity(:named_by).as(:Chef)
      list(:toppings).as(:Topping)      
    end
    entity(:Chef) { string_value(:name) }
    value_object(:Topping) { string_value(:name) }
  end

  aggregate :Orders do
    head :Order do
      list(:line_items).as(:LineItem)
    end
    value_object :LineItem do
      string_value :pizza_name
      integer_value :quantity
      currency_value :price
      entity(:pizza).as(Pizzas: :Pizza)
    end
  end
end.activate.print

pp Pizzeria::Orders::Order.new(
  line_items: [
    {
      quantity: 1, 
      pizza_name: 'Cat', 
      price: 3.00, 
      pizza: { 
        name: 'Cat', 
        toppings: [{ name: 'peperoni' }],
        named_by: { name: "Chris Young" },
        description: 'Pure GOod'
      }
    }
  ]
)
