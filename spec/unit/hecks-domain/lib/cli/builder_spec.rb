describe HecksDomain::CLI::CommandBuilder do
  subject do
    described_class.new(name: 'pizza_builder')
  end

  it 'exists' do
    subject
  end
end
