module PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        describe Delete do
          subject { described_class.new(args: { id: 1 }, database: @database) }

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

          it 'deletes a pizza' do
            Create.new(args: pizza_attributes, database: @database).call
            subject.call
            expect(Query.new(database: @database).call(id: 1)).to_not be
          end
        end
      end
    end
  end
end
