class FakeListener
  def self.pizzas_create(command)
  end
end

describe Hecks::Ports::Left::App do
  let(:domain)        { PizzaServer }
  let(:fake_listener) { FakeListener }
  let(:pizza_attributes) do
    {
      name: "White Pizza",
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  subject { described_class.new(listeners: [fake_listener], domain: domain) }

  describe '#call' do
    it 'calls the method on the repository' do
      subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )

      expect(
        subject.query(
          query_name: :find_by_id,
          module_name: :pizzas,
          args: {id: 1}
        ).name
      ).to eq 'White Pizza'
    end

    it 'broadcasts the command over the events port' do
      expect(FakeListener).to receive(:pizzas_create)
      subject.call(
        command_name: :create,
        module_name: :pizzas,
        args: pizza_attributes)
    end

    it 'runs validations' do
      message = "did not contain a required property of 'name'"
      result = subject.call(
        command_name: :create,
        module_name: :pizzas,
        args: { }
      )
      expect(result.errors.first).to include(message)
    end
  end
end
