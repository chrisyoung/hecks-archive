describe HecksPlugins::JSONValidator do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:command) {
    HecksApplication::Commands::Create.new(
      args: pizza_attributes,
      repository: PizzaBuilder.repositories[:pizzas],
      domain_module: DOMAIN.domain_modules[:Pizzas]
    )
  }

  subject { described_class.new(command: command) }

  it 'lists errors' do
    expect(subject.call.errors).to eq(
      description: ['missing'],
      chef: ['missing']
    )
  end
end
