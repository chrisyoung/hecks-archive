describe Ph2::Utilities::InMemoryDatabase do
  subject          { described_class.new(domain_repositories: {pizzas: repository}) }
  let(:repository) { double('Repository') }

  describe '#delete_all' do
    it 'calls delete_all on repositories' do
      expect(repository).to receive(:delete_all)
      subject.delete_all
    end
  end

  describe '#[]' do
    it do
      expect(subject[:pizzas]).to eq repository
    end
  end
end
