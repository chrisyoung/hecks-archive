describe PizzaBuilder::Domain::Pizzas::SQLRepository do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      chef: { name: "Belleboche" },
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  describe '#delete' do
    it do
      id = described_class.create(pizza_attributes).id
      result = described_class.delete(id)
      expect(described_class.read(id)).to be nil
    end
  end

  describe '#create' do
    it do
      result = described_class.create(pizza_attributes)
      expect(result.id).to_not be_nil
    end
  end

  describe '#read' do
    it do
      result = described_class.create(pizza_attributes)

      pizza = described_class.read(result.id)
      expect(pizza.id).to eq result.id
    end
  end

  describe '#update' do
    it 'updates fields' do
      create_result = described_class.create(pizza_attributes)

      update_result = described_class.update(
        pizza_attributes.merge(
          id: create_result.id,
          name: "Belleboche Redux",
          toppings: [{ name: "Sausage" }],
          chef: { name: "Kathy Griffen" }
        )
      )

      pizza = described_class.read(create_result.id)

      expect(pizza.name).to eq "Belleboche Redux"
      expect(pizza.toppings.map(&:name)).to eq ["Sausage"]
      expect(pizza.chef.name).to eq "Kathy Griffen"
    end
  end
end
