describe Hecks::DomainBuilder::Head do
  it 'is a domain object' do
    expect(described_class.superclass).to be Hecks::DomainBuilder::DomainObject
  end
end
