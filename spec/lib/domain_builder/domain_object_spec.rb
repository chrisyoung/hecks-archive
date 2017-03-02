describe Hecks::DomainBuilder::DomainObject do
  subject { described_class.new(name: "pizza") }

  let(:name_attribute) {
    Hecks::DomainBuilder::Attribute.new("name:string", 'line_items')
  }

  describe 'name' do
    it 'lists the name' do
      expect(subject.name).to eq 'pizza'
    end
  end

  describe '#attributes' do
    it 'sets attributes' do
      subject.attributes("name:string")
      expect(subject.attributes).to eq [name_attribute]
    end
  end

  describe '#references' do
    xit 'sets references'
  end

  describe '#attribute_hash' do
    it 'returns a hash representation of the object' do
      subject.attributes("name:string")
      expect(subject.attribute_hash).to eq name: 'Value'
    end
  end

  describe '#attribute_string' do
    it 'represent the object as a string' do
      subject.attributes("name:string")
      expect(subject.attribute_string).to eq ['name:Value']
    end

    it 'includes a domain module' do
      subject.attributes("pizza:pizzas::pizza")
      expect(subject.attribute_string).to eq ['pizza:Pizzas::Pizza']
    end
  end
end
