describe Hecks::Adapters::SQLDatabase::Column do
  xit 'should convert Currency to BigDecimal' do
    expect(described_class.new(name: "price", type: "Currency").type).to eq 'BigDecimal'
  end
end
