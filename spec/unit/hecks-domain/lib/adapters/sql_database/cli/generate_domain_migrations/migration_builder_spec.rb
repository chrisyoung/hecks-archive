describe HecksAdapters::SQLDatabase::CLI::MigrationBuilder, focus: true do
  let(:generator) { double("Generator", template: nil) }

  it 'generates a migration from a template' do
    expect(generator).to receive(:template).with("migration.rb.tt", "db/migrate/1_create_pizzas.rb")
    described_class.new(generator, DOMAIN).call
  end
end
