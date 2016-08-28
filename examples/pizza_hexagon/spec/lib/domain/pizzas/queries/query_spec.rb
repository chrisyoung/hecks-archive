module PizzaHexagon::Domain
  describe Pizzas::Query do
    subject    { described_class.new(repository: repository) }
    let(:repository) { double('Repository') }

    describe '#call' do
      context 'with an id' do
        it '' do
          expect(repository).to receive(:read).with(1)
          subject.call(id: 1)
        end
      end
    end
  end
end
