# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Pizza" do
  describe 'attributes' do
    subject do
      described_class.new(name: name, description: description, toppings: toppings, id: id)
    end

    describe 'it should test all the attributes' do
      xit { expect(subject.id).to eq 1 }
    end

		describe '#name' do
			it { expect(subject.name).to eq name}
		end

		describe '#description' do
			it { expect(subject.description).to eq description}
		end

		describe '#toppings' do
			it { expect(subject.toppings).to eq toppings}
		end
  end
end
