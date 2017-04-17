class Hecks::Application
  describe 'Pizza Builder' do
    it 'A playground for pizza builder' do
      app = Hecks::Application.new(
        domain:    PizzaBuilder,
        database:  Hecks::Adapters::MemoryDatabase
      )

      create_pizza = app[:pizzas].create(PIZZA_ATTRIBUTES)
      pizza =        app[:pizzas].read(create_pizza.id)
      create_order = app[:orders].create(order_attributes(pizza))
      order =        app[:orders].read(create_order.id)
      expect(order.line_items.first.pizza_name).to eq pizza.name
    end

    def order_attributes(pizza)
      { line_items:
        [{ pizza_name: pizza.name,
           quantity: 1,
           price: 5.0,
           pizza: { id: pizza.id } }]
      }
    end
  end
end
