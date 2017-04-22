describe HecksDomainBuilder::Value do
  it 'is a domain object' do
    expect(described_class.superclass).to eq HecksDomainBuilder::DomainObject
  end
end
