describe GenerateDomainMigrations::MigrationBuilder::TableFactory do
  let(:spec) {
    Hecks::DomainBuilder.build "pizza_builder" do |pizza_builder|
      pizza_builder.module 'Pizzas' do |pizzas|
        pizzas.head("Pizza").attributes('toppings:[topping]', 'chef:chefs::chef')
        pizzas.value("Topping").attributes('name:string')
      end

      pizza_builder.module 'Chefs' do |chefs|
        chefs.head('Chef').attributes('name:string')
      end
    end
  }

  subject do
    described_class.new(spec).build
  end

  describe 'Joining Tables' do
    it 'creates joining tables for lists' do
      expect(subject.tables.map(&:name)).to include('pizzas_toppings')
    end

    it 'creates foreign keys for the join' do
      expect(subject.to_h[:pizzas_toppings].columns.map(&:name)).to include('pizzas_id', 'toppings_id')
    end
  end

  describe '#build' do
    it 'creates tables for domain modules' do
      expect(subject.tables.map(&:name)).to include('pizzas')
    end
  end

  describe 'Foreign Keys' do
    it '' do
      expect(subject.to_h[:pizzas].columns.map(&:name)).to include('chef_id')
    end
  end

  it '#to_h' do
    expect(subject.to_h[:pizzas_toppings].class).to eq GenerateDomainMigrations::MigrationBuilder::Table
  end
end
