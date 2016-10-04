class FakeListener
  def self.pizzas_create(command)
  end
end

describe Hecks::Ports::Left::App do
  let(:domain)        { PizzaServer }
  let(:fake_listener) { FakeListener }
  let(:pizza_attributes) do
    { name: "White Pizza", description: 'white sauce and chicken', toppings: [{ name: 'chicken' }] }
  end

  subject { described_class.new(listeners: [fake_listener], domain: domain) }

  describe '#call' do
    it 'calls the method on the repository' do
      expect(PizzaServer::Domain::Pizzas::Repository).to receive(:create).with(pizza_attributes)
      subject.call(command_name: :create, module_name: :pizzas, args: pizza_attributes)
    end

    it 'broadcasts the command over the events port' do
      expect(FakeListener).to receive(:pizzas_create)
      subject.call(command_name: :create, module_name: :pizzas, args: { name: "White Pizza", description: 'white sauce and chicken', toppings: [{ name: 'chicken' }] })
    end

    it 'runs validations' do
      result = subject.call(command_name: :create, module_name: :pizzas, args: { name: 1 } )
      expect(result.errors.first).to include("did not contain a required property of 'description'")
    end
  end
end
