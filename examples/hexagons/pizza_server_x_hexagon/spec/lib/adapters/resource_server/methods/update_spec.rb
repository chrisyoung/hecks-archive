module PizzaServerXHexagon
  module Adapters
    module ResourceServer
      describe Methods::Update do
        subject { described_class.new(hexagon: hexagon) }
        let(:hexagon) { PizzaServerXHexagon::App.new }
        let(:attributes) {{name: "TestEntity", children: ['this']}}
        let(:body) { double(read: {attributes: { name: "new name" }}.to_json) }

        before do
          hexagon.call(command: :create, module_name: :test, args: attributes)
        end

        describe '#call' do
          it do
            subject.call(id: 1, body: body, module_name: :test)
          end
        end
      end
    end
  end
end
