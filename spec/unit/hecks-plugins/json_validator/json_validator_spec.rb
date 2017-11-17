describe HecksPlugins::JSONValidator do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end

  describe "missing fields" do
    subject { described_class.new(command: command(pizza_attributes, 'pizzas')) }
    let(:errors) { subject.call.errors }

    it 'lists missing fields' do
      expect(errors).to eq(
        description: ['Missing'],
        chef: ['Missing']
      )
    end
  end

  describe 'wrong types' do
    describe do
      let(:order_attributes) do
        {
          line_items: 'dd'
        }
      end

      subject { described_class.new(command: command(order_attributes, 'orders')) }
      let(:errors) { subject.call.errors }

      it do
        expect(errors).to eq(
          line_items: ["Type mismatch. Got 'string', should have been 'array'"]
        )
      end
    end

    describe 'nested items' do
      let(:order_attributes) do
        {
          line_items: [{}]
        }
      end

      subject { described_class.new(command: command(order_attributes, 'orders')) }
      let(:errors) { subject.call.errors }

      it do
        expect(errors).to eq(
          {
            "line_items/0": {
              :pizza_name => ["Missing"],
              :quantity =>   ["Missing"],
              :price =>      ["Missing"],
              :pizza =>      ["Missing"]
            }
          }
        )
      end
    end
  end

  def command(attributes, module_name)
    HecksApplication::Commands::Create.new(
      args: attributes,
      repository: PizzaBuilder.repositories[module_name.to_sym],
      domain_module: DOMAIN.domain_modules[module_name.capitalize.to_sym]
    )
  end
end
