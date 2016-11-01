require_relative '../../../../lib/adapters/sql_database/sql_database'

describe Hecks::Adapters::SQLDatabase, :database do
  subject { described_class.new(domain: PizzaBuilder) }
  let(:application_adapter) {
    Hecks::Adapters::Application.new(
      domain:    PizzaBuilder,
      database:  Hecks::Adapters::SQLDatabase
    )
  }

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  describe 'create' do
    it do
      application_adapter.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      )
    end
  end

  describe 'read' do
    it do
      id = application_adapter.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      ).id

      result = application_adapter.query(
        query_name:   :find_by_id,
        module_name:  :pizzas,
        args:         { id: id }
      )
      expect(result).to_not be nil
    end
  end

  describe 'delete' do
    it do
      id = application_adapter.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      ).id

      application_adapter.call(
        command_name: :delete,
        module_name:  :pizzas,
        args:         { id: id }
      )

      result = application_adapter.query(
        query_name:   :find_by_id,
        module_name:  :pizzas,
        args:         { id: id }
      ).first

      expect(result).to be nil
    end
  end


  describe 'update' do
    it do
      id = application_adapter.call(
        command_name: :create,
        module_name:  :pizzas,
        args:         pizza_attributes
      ).id


      result = application_adapter.call(
        command_name: :update,
        module_name:  :pizzas,
        args:         pizza_attributes.merge(id: id, name: "new name")
      )

      expect(
        application_adapter.query(
          query_name:   :find_by_id,
          module_name:  :pizzas,
          args:         { id: id }
        ).first.name
      ).to eq 'new name'
    end
  end
end
