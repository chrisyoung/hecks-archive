describe Hecks::Adapters::MemoryDatabase do
  subject { described_class.new(domain: PizzaBuilder) }

  it 'exists' do
    subject
  end
end
