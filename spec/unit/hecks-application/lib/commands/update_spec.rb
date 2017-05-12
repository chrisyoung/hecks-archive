describe HecksApplication::Commands::Update do
  subject do
    described_class.new(
      args: PIZZA_ATTRIBUTES,
      domain_module: domain_module,
      repository: PizzaBuilder.repositories[:pizzas]
    )
  end

  let(:domain_module) { DOMAIN.domain_modules[:pizzas] }

  let(:pizza_attributes) do
    PIZZA_ATTRIBUTES.clone
  end

  describe '#call' do
    it 'returns itself' do
      expect(subject.call.class).to eq described_class
    end
  end

  describe '#result' do
    it 'success' do
      expect(subject.call.result[:success]).to be
    end
  end
end
