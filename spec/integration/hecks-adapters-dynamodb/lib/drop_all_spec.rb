describe HecksAdapters::DynamoDB::DropAll do
  let(:client) do
    double(
      'Client',
      create_table: nil,
      list_tables: double(
        'ListTablesResult',
        table_names: ["Existing Table To Delete"]
      ),
      delete_table: nil
    )
  end
  subject { described_class.new(client: client, domain: PizzaBuilder)}

  describe '#call' do
    xit 'Deletes existing tables' do
      HecksAdapters::DynamoDB::Migrate.new(
        client: client,
        domain: PizzaBuilder
      ).call

      expect(subject.call.result[:tables]).to eq ["Existing Table To Delete"]
    end
  end
end
