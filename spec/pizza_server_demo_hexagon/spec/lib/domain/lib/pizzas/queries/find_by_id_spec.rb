module PizzaServerDemoHexagon
  module Domain
    module Pizzas
      describe Queries::FindByID do
        let(:repository) { Repository }

        let(:pizza_attributes) {
          {
            name:        "The Yuck",
            description: "Tastes worse than it sounds",
            toppings:    [{ name: 'Crickets' }]
          }
        }

        subject { described_class.new(repository: repository) }

        describe '#call' do
          context 'with an id' do
            xit '' do
              result = Pizzas::Commands::Create.new(args: pizza_attributes, repository: repository).call
              expect(subject.call(id: 1)).to be
            end
          end
        end
      end
    end
  end
end
