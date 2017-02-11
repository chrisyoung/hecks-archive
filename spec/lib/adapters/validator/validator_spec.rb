describe Hecks::Adapters::Validator do

  let(:domain) do
    eval(File.read('spec/examples/pizza_builder/HECKS'))
  end

  let(:args) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end


  let(:head_spec) {
    head = Hecks::DomainBuilder::Head.new(name: 'Pizza')
    head.attributes('name:value', 'description:value', 'toppings:[Topping]')
    head
  }

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
