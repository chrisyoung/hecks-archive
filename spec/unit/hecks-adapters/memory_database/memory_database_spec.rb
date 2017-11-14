describe HecksAdapters::MemoryDatabase do
  subject { described_class.new(domain: PizzaBuilder) }

  it 'exists' do
    subject
  end

  it 'Works with the Hecks Application' do
    app = HecksApplication.new(
      domain: PizzaBuilder,
      database: described_class
    )

    expect(PizzaBuilder::Domain::Pizzas::Repository).to receive(:create).and_return(Struct.new(:id).new(1))
    app[:pizzas].create(PIZZA_ATTRIBUTES)
  end
end
