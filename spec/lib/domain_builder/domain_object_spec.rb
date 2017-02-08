describe Hecks::DomainBuilder::DomainObject do
  subject { described_class.new(name: "pizza") }

  let(:name_attribute) {
    Hecks::DomainBuilder::Attribute.new("name:value")
  }

  describe 'name' do
    it 'lists the name' do
      expect(subject.name).to eq 'pizza'
    end
  end

  describe '#attributes' do
    it 'sets attributes' do
      subject.attributes("name:value")
      expect(subject.attributes).to eq [name_attribute]
    end
  end

  describe '#references' do
    xit 'sets references'
  end

  describe '#attribute_hash' do
    it 'returns a hash representation of the object' do
      subject.attributes("name:value")
      expect(subject.attribute_hash).to eq name: 'Value'
    end
  end
end
