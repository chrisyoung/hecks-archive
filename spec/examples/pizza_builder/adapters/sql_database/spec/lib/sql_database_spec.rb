describe PizzaBuilder::Adapters::SQLDatabase do

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      chef: {name: "Belleboche"},
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  it do
    Hecks::Application.new(
      domain: PizzaBuilder,
      database: PizzaBuilder::Adapters::SQLDatabase
    )[:Pizzas].create(pizza_attributes)
  end
end
