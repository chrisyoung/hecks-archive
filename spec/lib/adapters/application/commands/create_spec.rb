def pizza_attributes
  {
    name: 'White Pizza',
    description: 'white sauce and chicken',
    toppings: [{ name: 'chicken' }]
  }
end

class Hecks::Adapters::Application
  describe Commands::Create do
    let!(:executed_command) do
      Commands::Create.new(args: pizza_attributes, repository: PizzaBuilder.repositories[:pizzas]).call
    end

    let(:pizza) do
      Queries::FindById.new(repository: PizzaBuilder.repositories[:pizzas]).call(id: executed_command.id)
    end

    let(:order_attributes) do
      { line_items:
        [
          {
            pizza_name: pizza.name,
            quantity: 1,
            price: 5.0,
            pizza: {id: pizza.id}
          }
        ]
      }
    end

    subject do
      Commands::Create.new(args: order_attributes,repository: PizzaBuilder.repositories[:orders])
    end

    describe '#call' do
      it do
        order_command = subject.call

        order = Queries::FindById.new(
          repository: PizzaBuilder.repositories[:orders]
        ).call(id: order_command.id)

        expect(order.line_items.first.pizza_name).to eq pizza.name
      end
    end
  end
end
