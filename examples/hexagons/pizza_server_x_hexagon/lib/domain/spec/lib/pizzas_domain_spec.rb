describe PizzaServerXHexagon::Domain do
  subject { described_class }
  describe '#modules' do
    it { expect(PizzaServerXHexagon::Domain.modules).to_not be_empty }
  end
end
