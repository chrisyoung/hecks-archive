describe HecksDomain::CLI::GenerateDomainObject::OptionFormatter do
  subject { described_class.new(["name:Value", "size:Value"]) }

  describe '#call' do
    describe 'formats' do
      it 'keys and values' do
        expect(subject.call("keys_and_values")).to eq "name: name, size: size"
      end

      it 'attribute_string' do
        expect(subject.call("attribute_string")).to eq ":name, :size"
      end

      it 'param_names' do
        expect(subject.call("param_names")).to eq "name:, size:"
      end
    end

    it 'can include an id' do
      expect(subject.call("param_names", include_id: true)).to eq "name:, size:, id:"
    end
  end
end
