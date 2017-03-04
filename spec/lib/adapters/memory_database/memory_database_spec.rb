describe Hecks::Adapters::MemoryDatabase do
  subject { described_class.new(domain: PizzaBuilder) }

  it 'exists' do
    subject
  end

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      chef: { name: 'belleboche' },
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end


  it 'Works with the Hecks Application' do
    app = Hecks::Application.new(
      domain: PizzaBuilder,
      database: described_class
    )

    expect(PizzaBuilder::Domain::Pizzas::Repository).to receive(:create)
    app[:pizzas].create(pizza_attributes)
  end
end
