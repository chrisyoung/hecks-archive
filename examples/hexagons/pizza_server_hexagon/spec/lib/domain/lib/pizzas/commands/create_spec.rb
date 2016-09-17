module PizzaServerHexagon
  module Domain
    module Pizzas
      describe Commands::Create do
        let(:chained_command) do
          double("ChainedCommand", call: double("ChainedCommand", errors: []))
        end

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

        xit 'attaches an id' do
          result = subject.call
          expect(result.id).to be
        end

        context "With errors" do
          let(:chained_command) do
            double("ChainedCommand", call: double("ChainedCommand", errors: ['boom']))
          end

          xit "wont create" do
            expect(subject.call.id).to_not be
          end
        end
      end
    end
  end
end