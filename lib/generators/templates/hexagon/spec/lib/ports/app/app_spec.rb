class TestListener
  def self.pizzas_create(command)
  end
end

describe PizzasHexagon::App do
  let(:method_params) do
    {
    module_name: :pizzas,
    command: :create,
    args: {
      name:        'Pizza',
      description: 'round',
      toppings:    ['yes']
    }}
  end

  subject do
    described_class.new(listeners: [TestListener])
  end

  describe '#call' do
    it 'calls the appropriate use case' do
      subject.call(method_params)
    end
  end

  context "Events Port" do
    it '' do
      expect(TestListener).to receive(:pizzas_create)
      subject.call(method_params)
    end
  end
end
