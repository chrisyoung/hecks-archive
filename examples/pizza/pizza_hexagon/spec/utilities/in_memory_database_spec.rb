describe PizzaHexagon::Databases::Memory do
  subject { described_class.new }

  describe '#delete_all' do
    it 'calls delete_all on repositories' do
      subject.delete_all
    end
  end

  describe '#[]' do
    it do
      expect(subject[:pizzas]).to eq PizzaHexagon::Domain::Pizzas::Repository
    end
  end
end
