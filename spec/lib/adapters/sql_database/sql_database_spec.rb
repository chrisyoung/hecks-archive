describe Hecks::Adapters::SQLDatabase, :database do
  subject { described_class.new(domain: PizzaBuilder) }
  let(:application_adapter) {
    Hecks::Adapters::Application.new(
      domain:    PizzaBuilder,
      database:  Hecks::Adapters::SQLDatabase
    )
  }

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  it 'is used by the application adapter' do
    application_adapter.call(
      command_name: :create,
      module_name:  :pizzas,
      args:         pizza_attributes
    )
  end
end
