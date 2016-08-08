# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Pizza" do
  describe 'attributes' do
    subject do
      described_class.new(id: 1, name: name )
    end

    describe '#id' do
      it { expect(subject.id).to eq 1 }
    end

		describe '#name' do
			it { expect(subject.name).to eq name}
		end
  end
end
