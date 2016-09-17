module PizzaServerHexagon
  module Adapters
    module ResourceServer
      describe Methods::Create do
        let(:args) do
          {
            name:        "Test Entity",
            children:    ['garlic', 'chicken']
          }
        end

        let(:body) { double("Body", read: args.to_json) }
        let(:hexagon) { PizzaServerHexagon::App.new }
        subject    { described_class.new(hexagon: hexagon) }

        describe '#call' do
          it 'creates a test entity' do
            result = subject.call(body: body, module_name: :test)
            expect(JSON.parse(result.first)["id"]).to eq 1
          end
        end
      end
    end
  end
end
