# frozen_string_literal: true
describe Hecks::Application do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      chef: {name: "Chef Ramsey"},
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:log_output) {[]}

  subject do
    Hecks::Application.new(
      domain:    PizzaBuilder,
      database:  Hecks::Adapters::MemoryDatabase,
      listeners: [Hecks::Adapters::Logger.new(output: log_output)]
    )
  end

  describe '#create' do
    it do
      id = subject[:pizzas].create(pizza_attributes).id
      expect(subject[:pizzas].read(id).name).to eq 'White Pizza'
    end
  end

  describe '#read' do
    it do
      id = subject[:pizzas].create(pizza_attributes).id
      expect(subject[:pizzas].read(id).name).to eq 'White Pizza'
    end
  end

  describe '#update' do
    it do
      id = subject[:pizzas].create(pizza_attributes).id
      res = subject[:pizzas].update(id, pizza_attributes.merge(name: "Green Pizza"))
      expect(subject[:pizzas].read(id).name).to eq 'Green Pizza'
    end
  end

  describe '#delete' do
    it do
      id = subject[:pizzas].create(pizza_attributes).id
      res = subject[:pizzas].delete(id)
      expect(subject[:pizzas].read(id)).to eq nil
    end
  end

  describe '#call' do
    it 'Runs a command' do
      result = subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )

      expect(
        subject.query(
          query_name:  :find_by_id,
          module_name: :pizzas,
          args:        { id: result.id }
        ).name
      ).to eq 'White Pizza'
    end

    it 'Broadcasts events' do
      subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )
      expect(log_output.first).to include('pizzas_create')
    end
  end
end
