module PizzaHexagon
  module Domain
    module Pizzas
      describe UseCases::Create do
        subject do
          described_class.new(
            args: {
              name: "White Pizza",
              description: 'yes',
              toppings: ['garlic', 'chicken']
            })
        end

        it 'attaches an id' do
          result = subject.call
          expect(result.id).to be
        end
      end
    end
  end
end
