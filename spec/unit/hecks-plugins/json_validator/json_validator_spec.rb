describe HecksPlugins::JSONValidator do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:order_attributes) do
    {
      line_items: 'dd'
    }
  end

  let(:pizza_command) {
    HecksApplication::Commands::Create.new(
      args: pizza_attributes,
      repository: PizzaBuilder.repositories[:pizzas],
      domain_module: DOMAIN.domain_modules[:Pizzas]
    )
  }

  let(:order_command) {
    HecksApplication::Commands::Create.new(
      args: order_attributes,
      repository: PizzaBuilder.repositories[:orders],
      domain_module: DOMAIN.domain_modules[:Orders]
    )
  }

  describe "missing fields" do
    subject { described_class.new(command: pizza_command) }
    let(:errors) { subject.call.errors }

    it 'lists missing fields' do
      expect(errors).to eq(
        description: ['Missing'],
        chef: ['Missing']
      )
    end
  end

  describe 'wrong types' do
    subject { described_class.new(command: order_command) }
    let(:errors) { subject.call.errors }

    it do
      expect(errors).to eq(
        line_items: ["Type mismatch. Got 'string', should have been 'array'"]
      )
    end
  end
end
