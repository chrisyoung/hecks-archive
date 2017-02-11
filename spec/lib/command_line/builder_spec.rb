describe Hecks::Builder do
  let(:hecks_file) {File.read('spec/examples/pizza_builder/HECKS')}
  subject do
    described_class.new(hecks_file: hecks_file, name: 'pizza_builder')
  end

  it '' do
    subject
  end
end
