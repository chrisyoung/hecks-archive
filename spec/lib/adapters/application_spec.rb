# frozen_string_literal: true
describe Hecks::Adapters::Application do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  subject do
    Hecks::Adapters::Application.new(
      driving:          PizzaBuilder,
      database:         Hecks::Adapters::MemoryDatabase,
      event_listeners:  [Hecks::Adapters::ToppingCache]
    )
  end

  describe '#call' do
    it 'calls the method on the repository' do
      subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )

      expect(
        subject.query(
          query_name: :find_by_id,
          module_name: :pizzas,
          args: { id: 1 }
        ).name
      ).to eq 'White Pizza'
    end

    it 'runs validations' do
      message = "did not contain a required property of 'name'"
      result = subject.call(
        command_name: :create,
        module_name: :pizzas,
        args: {}
      )
      expect(result.errors.first).to include(message)
    end

    it 'broadcasts the command over the events port' do
      subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )
      expect(listener.called).to eq true
    end
  end
end
