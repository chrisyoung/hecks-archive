describe PizzasHexagon::Adapters::ResourceServer::Methods::Read do

  subject          { described_class.new(hexagon: hexagon) }
  let(:hexagon)    { PizzasHexagon::App.new }
  let(:repository) { Domain::Pizzas::Repository }

  let(:pizza_attributes) {
    {
      name:        "The Yuck",
      description: "Tastes worse than it sounds",
      toppings:    ['Crickets']
    }
  }

  before do
    hexagon.call(command: :create, module_name: :pizzas, args: pizza_attributes)
  end

  describe '#call' do
    it 'can read a pizza from the database' do
      result = subject.call(id: 1, module_name: :pizzas)
      expect(JSON.parse(result.first)['name']).to eq 'The Yuck'
    end
  end
end