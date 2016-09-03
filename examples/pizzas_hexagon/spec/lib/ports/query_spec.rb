describe PizzasHexagon::Ports::Query do
  subject do
    described_class.new(
      module_name: :pizzas,
      query_name:  :find_by_id,
      args: { id: 1} )
  end

  describe '#call' do
    it { subject.call }
  end

end
