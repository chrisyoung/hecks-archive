describe Hecks::Adapters::Validator do

  let(:domain) do
    Hecks.specification
  end

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:command) {
    Hecks::Adapters::Application::Commands::Create.new(
      args: pizza_attributes,
      repository: PizzaBuilder.repositories[:pizzas],
      domain_module: domain.domain_modules[:Pizzas]
    )
  }

  subject { described_class.new(command: command) }

  it 'lists errors' do
    expect(subject.call.errors).to eq description: ['missing']
  end
end
