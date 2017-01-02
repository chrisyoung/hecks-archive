def pizza_attributes
  {
    name: 'White Pizza',
    description: 'white sauce and chicken',
    toppings: [{ name: 'chicken' }]
  }
end

class Hecks::Adapters::Application
  describe Commands::Create do
    subject do
      Commands::Create.new(
        args: pizza_attributes,
        repository: PizzaBuilder.repositories[:pizzas]
      )
    end

    describe '#call' do
      it do
        subject.call
      end
    end
  end

  describe Commands::Create do
    let!(:executed_command) do
      Commands::Create.new(
        args: pizza_attributes,
        repository: PizzaBuilder.repositories[:pizzas]
      ).call
    end

    let(:pizza) do
      Queries::FindById.new(
        repository: PizzaBuilder.repositories[:pizzas]
      ).call(id: executed_command.id)
    end

    let(:order_attributes) do
      order_pizza = PizzaBuilder::Domain::Orders::Pizza.new(name: pizza.name, toppings: pizza.toppings)
      {
        line_items: [
          PizzaBuilder::Domain::Orders::LineItem.new(
            pizza: order_pizza, quantity: 1, price: 5.0
          )
        ]
      }
    end

    subject do
      Commands::Create.new(
        args: order_attributes,
        repository: PizzaBuilder.repositories[:orders]
      )
    end

    describe '#call' do
      it do
        order_command = subject.call

        order = Queries::FindById.new(
          repository: PizzaBuilder.repositories[:orders]
        ).call(id: order_command.id)

        expect(order.line_items.first.pizza.name).to eq pizza.name
      end
    end
  end
end
