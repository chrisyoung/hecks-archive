class Hecks::Adapters::Application
  describe Commands::Create do
    let(:domain) do
      eval(File.read('spec/examples/pizza_builder/HECKS'))
    end

    subject do
      Commands::Create.new(args: pizza_attributes, domain_module: domain.domain_modules.first, repository: PizzaBuilder.repositories[:pizzas])
    end

    let(:pizza) do
      Queries::FindById.new(repository: PizzaBuilder.repositories[:pizzas]).call(id: subject.id)
    end

    let(:pizza_attributes) do
      {
        name: 'White Pizza',
        description: 'white sauce and chicken',
        toppings: [{ name: 'chicken' }]
      }
    end

    describe '#call' do
      it 'returns itself' do
        expect(subject.call.class).to eq described_class
      end
    end

    describe '#id' do
      it 'has an id if the command is successful' do
        expect(subject.call.id).to_not be_nil
      end
    end

    describe '#errors' do
      it 'has errors if validatons fail' do
        pizza_attributes.delete(:description)
        expect(subject.call.errors).to_not be_nil
      end
    end
  end
end
