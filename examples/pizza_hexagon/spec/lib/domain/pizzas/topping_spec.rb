module PizzaHexagon::Domain
  describe Pizzas::Topping do
    subject { described_class.new }

    let(:name) { double('Name') }

    describe 'attributes' do
      subject do
        described_class.new(name: name )
      end

      		describe '#name' do
			it { expect(subject.name).to eq name}
		end
    end
  end
end
