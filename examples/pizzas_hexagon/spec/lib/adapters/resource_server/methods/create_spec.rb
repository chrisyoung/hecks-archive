describe PizzasHexagon::Adapters::ResourceServer::Methods::Create do
  let(:body){double("Body", read: '{"this":"that"}')}

  subject { described_class.new(hexagon: PizzasHexagon::App.new) }
  describe '#call' do
    it 'creates a pizza' do
      subject.call(body: body, module_name: :pizzas)
    end
  end
end
