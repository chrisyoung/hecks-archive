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
        pizzas.head("Pizza").attributes('name:string', 'price:currency', 'quantity:integer', 'toppings:[topping]')
      end
    end

    builder = described_class.new(generator, spec).call

    expect(builder.attributes[0]).to eq Hecks::DomainBuilder::Attribute.new("name:string")
    expect(builder.attributes[1].type).to eq "BigDecimal"
    expect(builder.attributes[2]).to eq Hecks::DomainBuilder::Attribute.new("quantity:integer")
  end
end
