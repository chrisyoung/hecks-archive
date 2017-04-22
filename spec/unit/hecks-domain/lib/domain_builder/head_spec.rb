describe HecksDomainBuilder::Head do
  it 'is a domain object' do
    expect(described_class.superclass).to be HecksDomainBuilder::DomainObject
  end
end
