describe PizzaServerHexagon::CommandName do
  subject { described_class.new(command) }

  let(:command) { PizzaServerHexagon::Domain::Test::Commands::Create.new(args: {name: 'this'}) }

  describe '#to_sym' do
    it { expect(subject.to_sym).to eq :test_create }
  end

  describe '#name' do
    it { expect(subject.name).to eq :create }
  end

  describe '#module' do
    it { expect(subject.module).to eq :test }
  end
end
