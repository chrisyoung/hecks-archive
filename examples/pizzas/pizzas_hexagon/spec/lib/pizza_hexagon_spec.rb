describe Pizzas::App do
subject { described_class.new }

  describe '#delete_all' do
    it 'delegates to the database_adapter' do
      subject.delete_all
    end
  end

  describe '#query' do
    it 'delegates to the repository' do
      subject.query(:pizzas)
    end
  end

  describe '#run' do
    it 'calls the appropriate use case' do
      subject.run(:pizzas, :create, {name: 'Pizza', description: 'round' , toppings: [{name: 'yes'}]})
    end
  end
end
