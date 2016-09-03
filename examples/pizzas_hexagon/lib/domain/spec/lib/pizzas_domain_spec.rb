describe PizzasHexagon::Domain do
  subject { described_class }
  describe '#modules' do
    it { expect(PizzasHexagon::Domain.modules).to_not be_empty }
  end
end
