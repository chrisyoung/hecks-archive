# frozen_string_literal: true
describe Hecks::Adapters::Application do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:log_output) {[]}

  subject do
    Hecks::Adapters::Application.new(
      domain:    PizzaBuilder,
      database:  Hecks::Adapters::MemoryDatabase,
      listeners: [Hecks::Adapters::Logger.new(output: log_output)],
      domain_spec: eval(File.read('spec/examples/pizza_builder/HECKS'))
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
      subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )

      expect(
        subject.query(
          query_name:  :find_by_id,
          module_name: :pizzas,
          args:        { id: 1 }
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
