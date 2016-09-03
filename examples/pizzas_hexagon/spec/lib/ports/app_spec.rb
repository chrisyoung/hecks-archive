class TestListener
  def self.pizzas_create(command)
  end
end

describe PizzasHexagon::App do
  subject do
    described_class.new(
      module_name: :pizzas,
      command: :create,
      args: {
        name: 'Pizza',
        description: 'round' ,
        toppings: [{ name: 'yes' }],
      },
      listeners: [TestListener]
      )
  end

  describe '#call' do
    it 'calls the appropriate use case' do
      subject.call()
    end
  end

  context "Events Port" do
    it do
      expect(TestListener).to receive(:pizzas_create)
      subject.call()
    end
  end
end
