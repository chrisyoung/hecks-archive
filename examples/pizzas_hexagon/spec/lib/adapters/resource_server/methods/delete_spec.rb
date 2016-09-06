describe PizzasHexagon::Adapters::ResourceServer::Methods::Delete do
  let(:hexagon) { PizzasHexagon::App.new }

  let(:pizza_attributes) do
    {
      name:        "The Yuck",
      description: "Tastes worse than it sounds",
      toppings:    [{ name: 'Crickets' }]
    }
  end

  subject { described_class.new(hexagon: hexagon) }

  describe '#call' do
    before do
      hexagon.call(command: :create, module_name: :pizzas, args: pizza_attributes)
    end

    it 'deletes' do
      subject.call(id: 1, module_name: :pizzas).first
      result = hexagon.query(query: :find_by_id, module_name: :pizzas, args: { id: 1 })
      expect(result).to_not be
    end

    context 'not found' do
      before do
        hexagon.call(command: :delete, module_name: :pizzas, args: {id: 1})
      end

      it 'returns an error' do
        result = subject.call(id: 1, module_name: :pizzas).first
        expect(JSON.parse(result)["errors"]).to include('cound not find 1')
      end
    end
  end
end
