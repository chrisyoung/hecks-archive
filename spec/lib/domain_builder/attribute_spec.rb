describe Hecks::DomainBuilder::Attribute do
  let(:basic)            { described_class.new('description:value') }
  let(:module_reference) { described_class.new('pizza:pizzas::pizza') }
  let(:basic_list)       { described_class.new('toppings:[topping]') }

  let(:list_module_reference) do
    described_class.new('toppings:topping::[topping]')
  end

  describe '#==' do
    it 'is not equal if name doesnt match' do
      other = described_class.new('unmatching:value')
      expect(other).to_not eq basic
    end

    it 'is not equal if type doesnt match' do
      other = described_class.new('description:string')
      expect(other).to_not eq basic
    end

    it 'is not equal if domain_module doesnt match' do
      other = described_class.new('pizza:orders::pizza')
      expect(other).to_not eq module_reference
    end

    it 'is equal if everything matches' do
      other = described_class.new('pizza:pizzas::pizza')
      expect(other).to eq module_reference
    end
  end

  describe '#name' do
    it { expect(basic.name).to eq 'description' }
    it { expect(basic_list.name).to eq 'toppings' }
    it { expect(module_reference.name).to eq 'pizza' }
    it { expect(list_module_reference.name).to eq 'toppings' }
  end

  describe '#domain_module' do
    it { expect(basic.domain_module).to be_nil }
    it { expect(basic_list.domain_module).to be_nil }
    it { expect(module_reference.domain_module).to eq 'Pizzas' }
    it { expect(list_module_reference.domain_module).to eq 'Topping' }
  end

  describe '#type' do
    it { expect(basic.type).to eq 'Value' }
    it { expect(basic_list.type).to eq 'Topping' }
    it { expect(module_reference.type).to eq 'Pizza' }
    it { expect(list_module_reference.type).to eq 'Topping' }
  end

  describe '#list?' do
    it { expect(basic.list?).to eq false }
    it { expect(basic_list.list?).to eq true }
    it { expect(module_reference.list?).to eq false }
    it { expect(list_module_reference.list?).to eq true }
  end
end
