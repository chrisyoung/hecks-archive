Hecks::DomainBuilder.build "pizza_builder" do |pizza_builder|
  pizza_builder.module 'Pizzas' do |pizzas|
    pizzas.head("Pizza").attributes('name', 'description', 'toppings[Topping]')
    pizzas.value("Topping").attributes('name')
  end

  pizza_builder.module 'Orders' do |orders|
    orders.head("Order").attributes('line_items')
    orders.value("Pizza").attributes("name", "toppings")
    orders.value("LineItem").attributes('pizza', 'quantity', 'price')
  end
end
