module PizzaServerXHexagon
  module Adapters
    module ResourceServer
      describe Methods::Update do
        subject { described_class.new(hexagon: hexagon) }
        let(:hexagon) { PizzaServerXHexagon::App.new }
        let(:body) { double("Body", read: {}.to_s) }

        describe '#call' do
          xit do
            subject.call(id: 1, body: body, module_name: :pizzas)
          end
        end
      end
    end
  end
end
