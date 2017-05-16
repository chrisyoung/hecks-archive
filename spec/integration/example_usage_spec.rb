class HecksApplication
  describe 'Pizza Builder' do
    it 'A playground for pizza builder' do

      # This is a hecks app configured to use the PizzaBuilder domain.
      app = HecksApplication.new(domain: PizzaBuilder)

      # Access Domain modules like this:
      # $ app[:pizzas]
      # Let's create a pizza
      pizza_id = app[:pizzas].create(PIZZA_ATTRIBUTES).head[:id]

      # Create an order for the pizza
      order_id = app[:orders].create(pizza_order_attributes(pizza_id)).head[:id]

      # Eventually, we can read these back
      pizza = app[:pizzas].read(pizza_id)
      order = app[:orders].read(order_id)

      expect(order.line_items.first.pizza_name).to eq pizza.name

      # This is the default Command Bus.  A Hecks Command Bus should return an
      # id that can be used to reference command results.  This should translate
      # into an "eventually consistent" persistence model
      app = HecksApplication(
        domain:         PizzaBuilder,
        command_runner: HecksAdaptersCommandRunner
      )

      # The result of using these in memory default adapters is that Hecks is
      # miminmally configured and FAST out of the box.
    end

    private

    def pizza_order_attributes(pizza_id)
      ORDER_ATTRIBUTES.merge(
        line_items: [
          ORDER_ATTRIBUTES[:line_items].first.merge(
            {pizza: {id: pizza_id}
          })
        ]
      )
    end
  end
end
