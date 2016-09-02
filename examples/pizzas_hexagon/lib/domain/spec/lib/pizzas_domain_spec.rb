describe Pizzas::Domain do
  subject { described_class }
  describe '#modules' do
    it { expect(Pizzas::Domain.modules).to_not be_empty }
  end
end
