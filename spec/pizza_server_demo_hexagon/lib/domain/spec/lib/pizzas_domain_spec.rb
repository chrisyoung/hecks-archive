describe PizzaServerDemoHexagon::Domain do
  subject { described_class }
  describe '#modules' do
    it { expect(PizzaServerDemoHexagon::Domain.modules).to_not be_empty }
  end
end
