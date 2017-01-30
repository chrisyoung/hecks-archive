describe Hecks::DomainBuilder::DomainModule do
  subject do
    described_class.new(name: 'pizzas')
  end

  describe '#head' do
    it 'creates a head entity' do
      subject.head('pizza')
      expect(subject.head.name).to eq 'pizza'
    end
  end

  describe '#value' do
    it 'creates a value object' do
      subject.value('topping')
      expect(subject.objects.first.name).to eq 'topping'
    end
  end

  describe '#reference' do
    it 'refers to aggregate entities' do
      subject.reference('pitches::pitch')
    end
  end

  describe '#objects' do
    it 'lists objects' do
      subject.head('pizza')
      subject.value('topping')
      expect(subject.objects.count).to eq 2
    end
  end
end
