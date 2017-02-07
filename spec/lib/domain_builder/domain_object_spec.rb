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
    it 'sets references' do
      subject.attributes("puzzle:puzzles::puzzle")
    end
  end
end
