module PizzasHexagon
  module Domain
    module Pizzas
      describe UseCases::Create do
        let(:chained_command) { double("ChainedCommand", errors: []) }

        subject do
          described_class.new(
            chained_command,
            args: {
              name:        "White Pizza",
              description: 'yes',
              toppings:    ['garlic', 'chicken']
            }
          )
        end

        it 'attaches an id' do
          result = subject.call
          expect(result.id).to be
        end

        context "With errors" do
          let(:chained_command) { double("ChainedCommand", errors: ['boom']) }

          it "wont create" do
            expect(subject.call.id).to_not be
          end
        end
      end
    end
  end
end
