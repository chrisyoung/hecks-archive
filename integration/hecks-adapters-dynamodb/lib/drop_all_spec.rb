describe Hecks::Adapters::DynamoDB::DropAll do
  let(:client) do
    double('Client',
      create_table: nil,
      list_tables: double('ListTablesResult',
        table_names: ["Existing Table To Delete"]
      ),
      delete_table: nil
    )
  end
  subject { described_class.new(client: client, domain: PizzaBuilder)}

  describe '#call' do
    it 'Deletes existing tables' do
      Hecks::Adapters::DynamoDB::Migrate.new(
        client: client,
        domain: PizzaBuilder
      ).call

      expect(subject.call.result[:tables]).to eq ["Existing Table To Delete"]
    end
  end
end
