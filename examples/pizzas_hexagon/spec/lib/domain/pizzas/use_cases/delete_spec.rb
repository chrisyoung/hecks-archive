module PizzasHexagon
  module Domain
    module Pizzas
      module Commands
        describe Delete do
          subject { described_class.new(args: { id: 1 }, repository: @repository) }

          let(:pizza_attributes) {
            { name:        "The Yuck",
              description: "Tastes worse than it sounds",
              toppings: [
                { name: 'Crickets' }
              ]
            }
          }

          before do
            @repository = Repository
          end

          it 'deletes a pizza' do
            Create.new(args: pizza_attributes, repository: @repository).call
            subject.call
            expect(Query.new(repository: @repository).call(id: 1)).to_not be
          end
        end
      end
    end
  end
end
