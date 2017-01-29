describe Hecks::DomainBuilder::Attribute do
  let(:basic)            { described_class.new(['description', 'value']) }
  let(:module_reference) { described_class.new(['pizza', 'pizzas::pizza']) }
  let(:basic_list)       { described_class.new(['toppings', '[topping]']) }
  let(:list_module_reference) do
    described_class.new(["toppings", 'topping::[topping]'])
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
    it { expect(module_reference.domain_module).to eq 'pizzas' }
    it { expect(list_module_reference.domain_module).to eq 'topping' }
  end

  describe '#type' do
    it { expect(basic.type).to eq 'value' }
    it { expect(basic_list.type).to eq 'topping' }
    it { expect(module_reference.type).to eq 'pizza' }
    it { expect(list_module_reference.type).to eq 'topping' }
  end

  describe '#list?' do
    it { expect(basic.list?).to eq false }
    it { expect(basic_list.list?).to eq true }
    it { expect(module_reference.list?).to eq false }
    it { expect(list_module_reference.list?).to eq true }
  end
end
