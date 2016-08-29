module PizzaHexagon::Domain
  describe Pizzas::Query do
    let(:database) { PizzaHexagon::Databases::Memory.new }

    let(:pizza_attributes) {
      { name:        "The Yuck",
        description: "Tastes worse than it sounds",
        toppings: [
          { name: 'Crickets' }
        ]
      }
    }

    subject { described_class.new(database: database) }

    describe '#call' do
      context 'with an id' do
        it '' do
          result = Pizzas::UseCases::Create.new(args: pizza_attributes, database: database).call
          expect(subject.call(id: 1)).to be
        end
      end
    end
  end
end
