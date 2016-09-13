describe PizzasHexagon::CommandName do
  subject { described_class.new(command) }

  let(:command) { double("Command") }

  describe '#to_sym' do
    it { expect(subject.to_sym).to eq :pizzas_create }
  end

  describe '#name' do
    it { expect(subject.name).to eq :create }
  end

  describe '#module' do
    it { expect(subject.module).to eq :pizzas }
  end
end
