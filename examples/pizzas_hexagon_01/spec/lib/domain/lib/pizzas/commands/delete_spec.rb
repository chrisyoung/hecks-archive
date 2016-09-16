module PizzasHexagon
  module Domain
    module Pizzas
      module Commands
        describe Delete do
          subject do
            described_class.new(
              args:       { id: 1 },
              repository: @repository
            )
          end

          let(:pizza_attributes) do
            {
              name:        "The Yuck",
              description: "Tastes worse than it sounds",
              toppings:    [{ name: 'Crickets' }]
            }
          end

          let(:query) { Queries::FindByID.new(repository: @repository) }

          before do
            @repository = Repository
          end

          it 'deletes a pizza' do
            Create.new(args: pizza_attributes, repository: @repository).call
            subject.call
            expect(query.call(id: 1)).to_not be
          end
        end
      end
    end
  end
end
