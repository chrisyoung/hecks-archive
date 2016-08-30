module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        describe Update do
          let(:new_attributes) { { name: "new name" } }

          let(:pizza_attributes) {
            { name:        "The Yuck",
              description: "Tastes worse than it sounds",
              toppings: [
                { name: 'Crickets' }
              ]
            }
          }

          let(:repository) { Repository }

          subject do
            described_class.new(
              args: { id: 1, attributes: new_attributes },
              repository: repository
            )
          end

          it 'updates a pizza' do
            Create.new(args: pizza_attributes, repository: repository).call
            subject.call()
            expect(Query.new(repository: repository).call(id: 1)).to be
          end
        end
      end
    end
  end
end
