describe GenerateDomainMigrations::MigrationBuilder::TableFactory do
  let(:spec) {
    Hecks::DomainBuilder.build "pizza_builder" do |pizza_builder|
      pizza_builder.module 'Pizzas' do |pizzas|
        pizzas.head("Pizza").attributes('toppings:[topping]')
      end
    end
  }

  subject do
    described_class.new(spec).call
  end


  it do
    expect(subject.tables.map(&:name).values).to include('pizzas_toppings')
  end
end
