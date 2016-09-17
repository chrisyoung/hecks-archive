describe PizzaServerHexagon::Domain do
  subject { described_class }
  describe '#modules' do
    it { expect(PizzaServerHexagon::Domain.modules).to_not be_empty }
  end
end
