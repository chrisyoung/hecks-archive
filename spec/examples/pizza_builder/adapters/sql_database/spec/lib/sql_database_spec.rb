describe PizzaBuilder::Adapters::SQLDatabase do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  it do
    application = Hecks::Adapters::Application.new(
      domain: PizzaBuilder,
      database: described_class
    )

    expect(application[:pizzas].create(pizza_attributes).id).to eq 1
  end
end
