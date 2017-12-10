describe HecksDomain::CLI::GenerateDomainObject::AssignmentTemplate do
  context "from attributes hash" do
    it 'assigns values' do
      expect(described_class.new(["name:string"], assign_from_hash: true).render).to eq '@name = attributes[:name]'
    end

    it 'creates references to objects in other modules' do
      expect(described_class.new(["pizza:pizzas::pizza"], assign_from_hash: true).render).to eq '@pizza = PizzaReference.factory(attributes[:pizza])'
    end

    it 'uses factories for domain objects in the same module' do
      expect(described_class.new(["pizza:pizza"], assign_from_hash: true).render).to eq '@pizza = Pizza.factory(attributes[:pizza])'
    end
  end

  context "default" do
    it 'assigns values' do
      expect(described_class.new(["name:string"]).render).to eq '@name = name'
    end

    it 'creates references to objects in other modules' do
      expect(described_class.new(["pizza:pizzas::pizza"]).render).to eq '@pizza = PizzaReference.factory(pizza)'
    end

    it 'uses factories for domain objects in the same module' do
      expect(described_class.new(["pizza:pizza"]).render).to eq '@pizza = Pizza.factory(pizza)'
    end
  end
end
