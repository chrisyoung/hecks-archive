describe Hecks::Adapters::DynamoDB::Migrate do
  let(:client) do
    double(
      "Client",
      create_table: nil
    )
  end

  subject do
    described_class.new(
      client: client,
      domain: PizzaBuilder
    )
  end

  describe '#call' do
    it 'creates a table for each head' do
      expect(subject.call.result).to eq({
        :unchanged_tables=>[],
        :new_tables=>["Pizza", "Order"]
      })
    end
  end
end
