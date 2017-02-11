describe Hecks::DomainBuilder do
  subject do
    described_class.build("pizza_builder") do |builder|
      builder.module 'pizzas' do |pizzas|
        pizzas.head("Pizza").attributes('name:value', 'description:value', 'toppings:[Topping]')
        pizzas.value("Topping").attributes('name:value')
      end
    end
  end

  describe '#domain' do
    it 'returns the domain in the builder' do
      expect(subject.domain.name).to eq 'pizza_builder'
    end
  end
  describe '#domain_modules' do
    it "lists domain modules" do
      expect(subject.domain_modules[:pizzas].name).to eq 'pizzas'
    end
  end
end
