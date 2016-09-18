module PizzaServerHexagon
  module Domain
    module Test
      describe Commands::Create do
        let(:chained_command) do
          double("ChainedCommand", call: double("ChainedCommand", errors: []))
        end

        let(:args) do
          { name: "White Pizza", description: 'A local favorite', toppings: ['garlic', 'chicken'] }
        end

        subject do
          described_class.new(chained_command, args: args)
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
