describe PizzasHexagon::Adapters::ResourceServer::Methods::Update do
  subject { described_class.new(hexagon: hexagon) }
  let(:hexagon) { PizzasHexagon::App.new }
  let(:body) { double("Body", read: {}.to_s) }

  describe '#call' do
    it do
      subject.call(id: 1, body: body, module_name: :pizzas)
    end
  end
end
