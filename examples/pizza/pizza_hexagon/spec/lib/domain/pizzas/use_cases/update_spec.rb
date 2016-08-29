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

          before do
            @database = Databases::Memory.new
          end

          subject do
            described_class.new(
              args: { id: 1, attributes: new_attributes },
              database: @database
            )
          end

          it 'updates a pizza' do
            Create.new(args: pizza_attributes, database: @database).call
            subject.call()
            expect(Query.new(database: @database).call(id: 1)).to be
          end
        end
      end
    end
  end
end
