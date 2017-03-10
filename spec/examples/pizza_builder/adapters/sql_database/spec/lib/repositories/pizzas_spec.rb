describe Hecks::Adapters::SQLDatabase::Repository do
  let(:pizza_attributes) do
    { name: 'White Pizza',
      chef: { name: "Belleboche" },
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]}
  end

  subject do
    described_class.new(module_name: :Pizzas)
  end

  describe '#delete' do
    let(:id) { subject.create(pizza_attributes).id }
    let!(:result) { subject.delete(id) }

    it do
      expect(subject.read(id)).to be nil
    end
  end

  describe '#create' do
    let(:result) { subject.create(pizza_attributes) }
    it do
      expect(result.id).to_not be_nil
    end
  end

  describe '#read' do
    let(:result) { subject.create(pizza_attributes) }
    let(:pizza) { subject.read(result.id) }

    it do
      expect(pizza.id).to eq result.id
    end
  end

  describe '#update' do
    let(:create_result) { subject.create(pizza_attributes) }
    let!(:update_result) { subject.update(update_attributes) }

    let(:update_attributes) do
      pizza_attributes.merge(
        id:       create_result.id,
        name:     "Belleboche Redux",
        toppings: [{ name: "Sausage" }],
        chef:     { name: "Kathy Griffen" }
      )
    end

    let(:pizza) { subject.read(create_result.id) }

    it 'updates fields' do
      expect(pizza.name).to eq "Belleboche Redux"
    end

    it 'updates relationship lists' do
      expect(pizza.toppings.map(&:name)).to eq ["Sausage"]
    end

    it 'updates relationships' do
      expect(pizza.chef.name).to eq "Kathy Griffen"
    end
  end
end
