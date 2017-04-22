describe HecksAdapters::SQLDatabase::Column do
  it 'should convert Currency to BigDecimal' do
    expect(described_class.new(name: "price", type: "Currency").type).to eq 'BigDecimal'
  end
end
