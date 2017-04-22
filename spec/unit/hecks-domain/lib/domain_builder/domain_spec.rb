describe HecksDomainBuilder::Domain do
subject { described_class.new(name: 'pizza_builder') }
  describe '#module' do
    it 'adds a domain module' do
      subject.module('Pizzas') do |pizzas|
        pizzas.head('pizza')
      end
      expect(subject.domain_modules[:Pizzas].name).to eq 'Pizzas'
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq 'pizza_builder'
    end
  end

end
