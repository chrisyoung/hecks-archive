load('spec/examples/pizza_builder/HECKS')

describe GenerateDomainMigrations::MigrationBuilder, focus: true do
  let(:generator) { double("Generator", template: nil) }

  it 'generates a migration from a template' do
    expect(generator).to receive(:template).with("migration.rb.tt", "db/migrations/1_create_pizzas.rb")
    described_class.new(generator, Hecks.specification).call
  end
end
