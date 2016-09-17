describe PizzaServerHexagon::CommandName do
  subject { described_class.new(command) }

  let(:command) { double("Command") }

  describe '#to_sym' do
    xit { expect(subject.to_sym).to eq :pizzas_create }
  end

  describe '#name' do
    xit { expect(subject.name).to eq :create }
  end

  describe '#module' do
    xit { expect(subject.module).to eq :pizzas }
  end
end
