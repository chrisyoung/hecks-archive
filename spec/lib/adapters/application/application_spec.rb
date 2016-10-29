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
      listeners: [Hecks::Adapters::Logger.new(output: log_output)]
    )
  end

  it 'Works with generated domains (see pizza_builder_schema.json)', :generator do
    # Generate a pizza_builder to run the tests against
    # see the file "pizza_builder_schema.json"

    puts `cd spec && rm -rf pizza_builder`
    puts `cd spec && ../bin/hecks new -n pizza_builder -s pizza_builder_schema.json`
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

    it 'Runs validations' do
      message = "did not contain a required property of 'name'"
      result  = subject.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         {}
      )
      expect(result.errors.first).to include(message)
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
