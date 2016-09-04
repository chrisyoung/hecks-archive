describe PizzasHexagon::Adapters::ResourceServer::Methods::Create do
  let(:args) do
    {
      name:        "White Pizza",
      description: 'yes',
      toppings:    ['garlic', 'chicken']
    }
  end
  let(:body) { double("Body", read: args.to_json) }
  subject    { described_class.new(hexagon: PizzasHexagon::App.new) }

  describe '#call' do
    it 'creates a pizza' do
      expect(subject.call(body: body, module_name: :pizzas)).to eq ''
    end
  end
end
