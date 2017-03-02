load('spec/examples/pizza_builder/HECKS')

describe GenerateDomainMigrations::MigrationBuilder, focus: true do
  let(:generator) { double("Generator", template: nil) }

  it 'generates a migration from a template' do
    expect(generator).to receive(:template).with("migration.rb.tt", "db/migrations/1_create_pizzas.rb")
    described_class.new(generator, Hecks.specification).call
  end

  it do
    spec = Hecks::DomainBuilder.build "pizza_builder" do |pizza_builder|
      pizza_builder.module 'Pizzas' do |pizzas|
        pizzas.head("Pizza").attributes('name:string', 'price:currency', 'quantity:integer', 'toppings:[topping]', 'order:orders::order')
      end
    end

    builder = described_class.new(generator, spec).call

    expect(builder.columns[0].name).to eq 'name'
    expect(builder.columns[1].type).to eq "BigDecimal"
    expect(builder.columns[2].name).to eq 'quantity'
    expect(builder.columns[2].type).to eq 'Integer'
  end
end
