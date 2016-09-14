describe PizazHexagon::Domain do
  subject { described_class }
  describe '#modules' do
    it { expect(PizazHexagon::Domain.modules).to_not be_empty }
  end
end
