module PizzaServerHexagon
  module Adapters
    module ResourceServer
      describe Methods::Delete do
        let(:hexagon) { PizzaServerHexagon::App.new }

        let(:attributes) do
          {
            name:        "The Yuck",
            children:    [{ name: 'Crickets' }]
          }
        end

        subject { described_class.new(hexagon: hexagon) }

        describe '#call' do
          before do
            hexagon.call(command: :create, module_name: :test, args: attributes)
          end

          it 'deletes' do
            subject.call(id: 1, module_name: :test).first
            result = hexagon.query(query: :find_by_id, module_name: :pizzas, args: { id: 1 })
            expect(result).to_not be
          end

          context 'not found' do
            before do
              hexagon.call(command: :delete, module_name: :pizzas, args: {id: 1})
            end

            it 'returns an error' do
              result = subject.call(id: 1, module_name: :pizzas).first
              expect(JSON.parse(result)["errors"]["base"]).to include('cound not find 1')
            end
          end
        end
      end
    end
  end
end
