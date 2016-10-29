describe Hecks::Adapters::Application::Commands::Create do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  subject do
    described_class.new(
      args: pizza_attributes,
      repository: Hecks::Adapters::SQLDatabase.new(domain: PizzaBuilder)[:pizzas]
    )
  end

  describe '#call' do
    it do
      subject.call
    end
  end
end
